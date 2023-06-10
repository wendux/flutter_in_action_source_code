
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_client_app/common/funs.dart';
import 'package:github_client_app/common/git_api.dart';
import 'package:github_client_app/models/index.dart';
import 'package:provider/provider.dart';

import '../common/global.dart';
import '../l10n/localization_intl.dart';
import '../states/profile_change_notifier.dart';
import '../widgets/repo_item.dart';



class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  static const loadingTag = "##loading##";//表尾标记
  final _items = <Repo>[Repo()..name = loadingTag];
  bool hasMore = true; //是否还有数据
  int page = 1; //当前请求的是第几页

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(GmLocalizations.of(context)?.home ?? "")
      ),
      body: _buildBody(), // 构建主页面
      drawer: const MyDrawer(),
    );
  }

  Widget _buildBody() {
    UserModel userModel = Provider.of<UserModel>(context);
    print("_buildBody-------：${userModel.isLogin}");
    if (!userModel.isLogin) {
      return Center(
        child: ElevatedButton(
          child: Text(GmLocalizations.of(context)?.login ?? ""),
          onPressed: () => Navigator.of(context).pushNamed("login"),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          if (_items[index].name == loadingTag) {
            if (hasMore) {
              // 获取数据
              _retriieveDate(userModel.user?.login ?? "_retriieveDate login");
              // 加载时显示loading
              return Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0),
                ),
              );
            } else {
              // 已经加载了100条数据，不在获取数据
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text("没有更多数据了", style: TextStyle(color: Colors.grey)),
              );
            }
          }
          //显示单词列表项
          return RepoItem(_items[index]);
        },
      );
    }
  }

  // 请求数据
  void _retriieveDate(String username) async {
    try {
      var data = await Git(context).getRepos(
        queryParmeters: {
          'username' : username,
          'page': page,
          'page_size': 20,
        },
      );
      //如果返回的数据小于指定的条数，则表示没有更多数据，反之则否
      hasMore = data.length >0 && data.length % 20 ==0;
      setState(() {
        _items.insertAll(_items.length - 1, data);
        page++;
      });
    } on DioException catch(e) {
      if ((e.response?.statusCode ?? -1) != 200) {
          showToast(e.toString());
      }
    }

  }
}


class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(context: context,
          removeBottom: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(), // 构建抽屉菜单头部
              Expanded(child: _buildMenus()), //构建功能菜单
            ],
          )),
    );
  }

  Widget _buildHeader() {
    return Consumer<UserModel>(builder: (BuildContext context, UserModel value, Widget? child) {
        return GestureDetector(
          child: Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(top: 40, bottom: 20),
            child: Row(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ClipOval(
                    // 如果已登录，则显示用户头像；若未登录，则显示默认头像
                  child: value.isLogin ? gmAvatar(value.user?.avatar_url ?? "",
                      width: 80
                    ) : Image.asset("imgs/avatar-default.png", width: 80,),
                  ),
                ),
                Text(
                  value.isLogin ? value.user?.login ?? "isLogined"  : GmLocalizations.of(context)?.login ?? "--",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            if (!value.isLogin) {
              Navigator.of(context).pushNamed("login");
            }
          },
        );
    },

    );
  }

  Widget _buildMenus() {
    return Consumer<UserModel>(builder: (BuildContext context, UserModel value, Widget? child) {
        var gm = GmLocalizations.of(context);
        return ListView(
          children: [
            ListTile(
              leading: Icon(Icons.color_lens),
              title: Text(gm?.theme ?? "theme"),
              onTap: () => Navigator.pushNamed(context, "themes"),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text(gm?.language ?? "language"),
              onTap: () => Navigator.pushNamed(context, "language"),
            ),
            if (value.isLogin)
              ListTile(
                leading: Icon(Icons.power_settings_new),
                title: Text(gm?.logout ?? "logout"),
                onTap: () {
                    showDialog(context: context,
                      builder: (ctx) {
                         return AlertDialog(
                           content: Text(gm?.logoutTip ?? "logoutTip"),
                           actions: [
                             TextButton(onPressed: () => Navigator.pop(context),
                                 child: Text(gm?.cancel ?? "cancel")),

                             TextButton(onPressed: () {
                               // 该赋值语法会重新触发MaterialApp rebuild
                               value.user = null;
                               Navigator.pop(context);
                             },
                                 child: Text(gm?.yes ?? "yes"))
                           ],
                         );
                      }
                    );
                }
              ),
          ],
        );
    }
    );
  }
}
