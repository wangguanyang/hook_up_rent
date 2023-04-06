import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/scoped_model/auth.dart';
import 'package:hook_up_rent/pages/utils/common_toast.dart';
import 'package:hook_up_rent/pages/utils/dio_http.dart';
import 'package:hook_up_rent/pages/utils/scoped_model_helper.dart';
import 'package:hook_up_rent/pages/utils/store.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 显示密码
  bool showPassword = false;
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  _loginHandle() async {
    String username = usernameController.text;
    String password = passwordController.text;
    if (username.isEmpty || password.isEmpty) {
      CommonToast.showToast('用户名或密码不能为空！');
      return;
    }
    const url = '/user/login';
    var params = {'username': username, 'password': password};

    var res = await DioHttp.of(context).post(url, params);
    var resMap = json.decode(res.toString());
    int status = resMap['status'];

    String description = resMap['description'] ?? '内部错误';
    CommonToast.showToast(description);

    if (status.toString().startsWith('2')) {
      String token = resMap['body']['token'];
      Store store = await Store.getInstance();
      await store.setString(StoreKeys.token, token);
      if (context.mounted) {
        ScopedModelHelper.getModel<AuthModel>(context).login(token, context);
      }
      Timer(const Duration(seconds: 1), () {
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("登录"),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(30),
          child: ListView(children: [
            const Padding(padding: EdgeInsets.all(10)),
            // 用户名
            TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: "用户名",
                  hintText: "请输入用户名",
                )),
            const Padding(padding: EdgeInsets.all(10)),
            // 密码
            TextField(
                controller: passwordController,
                obscureText: !showPassword,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                  suffix: IconButton(
                    icon: Icon(
                        showPassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      // icon 点击事件，showPassword取反
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  ),
                )),
            const Padding(padding: EdgeInsets.all(10)),
            // 登录按钮 RaisedButton 已经废弃
            ElevatedButton(
              onPressed: () {
                // 登录按钮点击事件
                _loginHandle();
              },
              child: const Text("登录"),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // 居中显示
              children: [
                const Text("还没有账号,"),
                TextButton(
                  onPressed: () {
                    // 跳转注册页面
                    Navigator.pushReplacementNamed(context, "register");
                  },
                  child: const Text("去注册~"),
                )
              ],
            )
          ]),
        ));
  }
}
