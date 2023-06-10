
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_client_app/common/funs.dart';
import 'package:github_client_app/l10n/localization_intl.dart';
import 'package:github_client_app/models/index.dart';
import 'package:github_client_app/states/profile_change_notifier.dart';

import 'package:provider/provider.dart';

import '../common/git_api.dart';
import '../common/global.dart';

class LoginRoute extends StatefulWidget {
  const LoginRoute({Key? key}) : super(key: key);

  @override
  State<LoginRoute> createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  bool pwdShow = false;
  GlobalKey _formKey = GlobalKey<FormState>();
  bool _nameAutoFocus = false;

  @override
  void initState() {
    if (Global.profile.lastLogin != null) {
      _unameController.text = Global.profile.lastLogin!;
      if (_unameController.text.isNotEmpty) {
        _nameAutoFocus = false;
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    _unameController.dispose();
    _pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var gm = GmLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(gm?.login ?? "")),
      body:Padding(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autofocus: _nameAutoFocus,
                controller: _unameController,
                decoration: InputDecoration(
                  labelText: gm?.userName ?? "labelText",
                  hintText: gm?.userName ?? "",
                  prefixIcon: Icon(Icons.person)
                ),
                // 效验用户名(不能为空)
                validator: (v) {
                  return v==null || v.trim().isNotEmpty ? null : gm?.userNameRequired ?? "";
                },
              ),
              TextFormField(
                controller: _pwdController,
                autofocus: !_nameAutoFocus,
                decoration: InputDecoration(
                  labelText: gm?.password ?? "labelText",
                  hintText: gm?.password ?? "",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(pwdShow ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        pwdShow = !pwdShow;
                      });
                    },
                  ),
                ),
                obscureText: !pwdShow,
                validator: (v) {
                  return v == null || v.trim().isNotEmpty ? null : gm?.passwordRequired ?? "";
                }),
              Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 55.0),
                    child: ElevatedButton(
                      onPressed: _onLogin,
                      child: Text(gm?.login ?? ""),
                    ),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() async {
    // 先验证各个表单字段是否合法
    if ((_formKey.currentState as FormState).validate()) {
      // showLoading
      showLoading(context);
      User? user;
      try {
        user = await Git(context).login(_unameController.text,
            _pwdController.text);
        // 因为登录返回后，首页会build，所以我们传入false，这样更新user后便不触发更新。
        Provider.of<UserModel>(context, listen: false).user = user;
      } on DioException catch(e) {
        // 登录失败则提示
        if (e.response?.statusCode == 401) {
          // showToast
          showToast(GmLocalizations.of(context)?.userNameOrPasswordWrong ?? "");
        } else {
          showToast(e.toString());
        }
      } finally {
        // 隐藏loading框
        Navigator.of(context).pop();
      }
      // 登录成功则返回
      if (user != null) {
        Navigator.of(context).pop();
      }
    }
  }
}