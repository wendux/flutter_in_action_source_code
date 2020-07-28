import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../index.dart';
import '../index.dart';
import '../models/access.dart';

class Git {

  //请求授权的权限范围
  String _scope ="projects user_info issues notes";

  // 在网络请求过程中可能会需要使用当前的context信息，比如在请求失败时
  // 打开一个新路由，而打开新路由需要context信息。
  Git([this.context]) {
    _options = Options(extra: {"context": context});
  }

  BuildContext context;
  Options _options;
  static Dio dio = new Dio(BaseOptions(
    baseUrl: 'https://gitee.com/'
  ));

  static void init() {
    // 添加缓存插件
    dio.interceptors.add(Global.netCache);
    // 设置用户token（可能为null，代表未登录）
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.profile.token;

    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    if (!Global.isRelease) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (uri) {
          return "PROXY 10.0.3.2:5555";
        };
        //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  // 登录接口，登录成功后返回用户信息
  Future<User> login(String login, String pwd,String clientId,String clientSecret) async {
    //持久化该client信息
    Global.profile.giteeClient= GiteeClient()..client_id = clientId ..client_secret=clientSecret;
    Global.saveProfile();


    var data = {
      "grant_type":"password",
      "scope":_scope,
      "client_id":clientId,
      "client_secret":clientSecret,
      "username":login,
      "password":pwd
    };
    Response response=await dio.request(
      "/oauth/token",
      data: data,
      options:_options.merge(
        method: "post",
          contentType: "application/x-www-form-urlencoded",
          extra: {
            "noCache": true, //本接口禁用缓存
          }
      ),
    );
    var access = Access.fromJson(response.data);




    //清空所有缓存
    Global.netCache.cache.clear();
    //更新profile中的token信息
    Global.profile.token = access.access_token;
    return getUserInfo(login, pwd);
  }


  //获取已经授权的用户信息
  Future<User> getUserInfo(String login, String pwd) async {
    var r = await dio.get(
      "/api/v5/user",
        queryParameters:{
          "access_token":Global.profile.token
        },
      options: _options.merge(extra: {
        "noCache": true, //本接口禁用缓存
      }),
    );
    return User.fromJson(r.data);
  }




  //获取用户项目列表
  Future<List<Repo>> getRepos(
      {Map<String, dynamic> queryParameters, //query参数，用于接收分页信息
      refresh = false}) async {
    if (refresh) {
      // 列表下拉刷新，需要删除缓存（拦截器中会读取这些信息）
      _options.extra.addAll({"refresh": true, "list": true});
    }

    //添加授权信息
    queryParameters["access_token"]=Global.profile.token;

    var r = await dio.get<List>(
      "/api/v5/user/repos",
      queryParameters: queryParameters,
      options: _options,
    );
    return r.data.map((e) => Repo.fromJson(e)).toList();
  }
}
