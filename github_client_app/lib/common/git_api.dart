
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_client_app/common/global.dart';
import 'package:github_client_app/models/index.dart';

class Git {

  Git([this.context]) {
    _options = Options(extra: {"context": context});
  }

  BuildContext? context;
  late Options _options;
  static Dio dio = Dio(BaseOptions(
    baseUrl: 'https://api.github.com/',
    headers: {
      // HttpHeaders.acceptHeader: "application/vnd.github.squirrel-girl-preview,"
      //     "application/vnd.github.symmetra-preview+json",
    },
  ));

  static void init() {
    // 添加缓存插件
    dio.interceptors.add(Global.netCache);
    // 设置用户token(可能为null， 代表未登录)
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.profile.token;

    // 在调试模式下需要抓包调试，我们使用代理，并禁用HTTPS证书校验
    if (Global.isRelease) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => false;
      };
    }
  }

  // login 
  Future<User> login(String login, String pwd) async {
    //String basic = 'Basic' + base64.encode(utf8.encode('$login:$pwd'));
    final authBytes = utf8.encode('$login:$pwd');
    final authToken = 'Basic ${base64.encode(authBytes)}';
    var r = await dio.get(
      "/user",
      options: _options.copyWith(headers: {
        //HttpHeaders.authorizationHeader: basic
        'Authorization': authToken,
      }, extra: {
        "noCache": true, //本接口禁用缓存
      }),
    );
    print("response: $r");
    // 登录成功后更新公共头(authorization), 此后的所有请求都会带上用户身份信息
    dio.options.headers[HttpHeaders.authorizationHeader] == authToken;
    // 清空所有缓存
    Global.netCache.cache.clear();
    // 更新profile中token信息
    Global.profile.token = authToken;
    return User.fromJson(r.data);
  }

  // fetch user project list
  Future<List<Repo>> getRepos({Map<String, dynamic>? queryParmeters, refresh = false}) async {
     if (refresh) {
       _options.extra?.addAll({"refresh" : true, "list" : true});
     }
     String username = queryParmeters?["username"];
     print("username: $username");
     var r = await dio.get<List>(
         "/users/${queryParmeters?["username"]}/repos",
         queryParameters: queryParmeters,
         options: _options,
     );
     return r.data!.map((e) => Repo.fromJson(e)).toList();
  }

}