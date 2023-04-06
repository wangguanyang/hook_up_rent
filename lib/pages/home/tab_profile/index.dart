import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/info/index.dart';
import 'package:hook_up_rent/pages/scoped_model/auth.dart';
import 'package:hook_up_rent/pages/utils/scoped_model_helper.dart';
import 'package:scoped_model/scoped_model.dart';
import 'advertisment.dart';
import 'function_button.dart';
import 'header.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('我的'),
          actions: [
            IconButton(
              onPressed: () {
                // 设置页面
                bool isLogin =
                    ScopedModelHelper.getModel<AuthModel>(context).isLogin;
                if (isLogin) {
                  Navigator.of(context).pushNamed('setting');
                }
                Navigator.of(context).pushNamed('login');
              },
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: ListView(
          children: const [
            Header(),
            FunctionButton(),
            Advertisment(),
            Info(
              showTitle: true,
            ),
          ],
        ));
  }
}
