import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/utils/common_toast.dart';
import 'package:hook_up_rent/pages/utils/dio_http.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var repeatPasswordController = TextEditingController();

  _registerHandler() async {
    var username = usernameController.text;
    var password = passwordController.text;
    var repeatPassword = repeatPasswordController.text;
    if (password != repeatPassword) {
      CommonToast.showToast('两次输入的密码不一致');
      return;
    }
    if (username.isEmpty || password.isEmpty) {
      CommonToast.showToast('用户名或密码不能为空');
      return;
    }

    const url = '/user/register';
    var params = {'username': username, 'password': password};
    var res = await DioHttp.of(context).post(url, params);
    var resString = json.decode(res.toString());
    int status = resString['status'];
    String description = resString['description'] ?? '内部错误';
    CommonToast.showToast(description);
    if (status.toString().startsWith('2')) {
      Navigator.of(context).pushReplacementNamed('login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("注册"),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(30),
          child: ListView(children: [
            // 用户名
            TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "请输入用户名",
                )),
            const Padding(padding: EdgeInsets.all(10)),
            // 密码
            TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                )),
            const Padding(padding: EdgeInsets.all(10)),
            // 确认密码
            TextField(
                controller: repeatPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "确认密码",
                  hintText: "请输入密码",
                )),
            const Padding(padding: EdgeInsets.all(10)),
            // 注册按钮 RaisedButton 已经废弃
            ElevatedButton(
              onPressed: () {
                // 注册按钮点击事件
                _registerHandler();
              },
              child: const Text("注册"),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // 居中显示
              children: [
                const Text("已有帐号"),
                TextButton(
                  onPressed: () {
                    // 跳转注册页面
                    Navigator.pushReplacementNamed(context, "login");
                  },
                  child: const Text("去登录~"),
                )
              ],
            )
          ]),
        ));
  }
}
