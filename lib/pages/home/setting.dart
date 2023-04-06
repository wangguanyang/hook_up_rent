import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/scoped_model/auth.dart';
import 'package:hook_up_rent/pages/utils/common_toast.dart';
import 'package:hook_up_rent/pages/utils/scoped_model_helper.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: ListView(children: [
        ElevatedButton(
          onPressed: () {
             ScopedModelHelper.getModel<AuthModel>(context).logout();
            CommonToast.showToast('已经退出登录');
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey),
          ),
          child: const Text(
            '退出登录',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ]),
    );
  }
}
