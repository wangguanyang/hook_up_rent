import 'package:flutter/material.dart';
import 'package:hook_up_rent/config.dart';
import 'package:hook_up_rent/pages/scoped_model/auth.dart';
import 'package:hook_up_rent/pages/utils/scoped_model_helper.dart';
import 'package:scoped_model/scoped_model.dart';

var loginRegisterStyle = TextStyle(fontSize: 20.0, color: Colors.white);

class Header extends StatelessWidget {
  const Header({super.key});

  Widget _notLoginBuilder(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      decoration: const BoxDecoration(color: Colors.green),
      height: 95.0,
      child: Row(
        children: [
          Container(
            height: 65.0,
            width: 65.0,
            margin: const EdgeInsets.only(right: 15),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://bpic.51yuansu.com/pic3/cover/00/94/68/58dcd73302a43_610.jpg'),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // 跳转登录页面
                      Navigator.of(context).pushNamed('login');
                    },
                    child: Text('登录', style: loginRegisterStyle),
                  ),
                  Text('/', style: loginRegisterStyle),
                  GestureDetector(
                    onTap: () {
                      // 跳转注册页面
                      Navigator.of(context).pushNamed('register');
                    },
                    child: Text(
                      '注册',
                      style: loginRegisterStyle,
                    ),
                  ),
                ],
              ),
              const Text('登录后可以体验更多', style: TextStyle(color: Colors.white))
            ],
          )
        ],
      ),
    );
  }

  Widget _loginBuilder(BuildContext context) {
    var userInfo = ScopedModel.of<AuthModel>(context).userInfo;

    String userName =
        userInfo.nickname.isNotEmpty ? userInfo.nickname : '已登录用户名';
    String userImage = userInfo.avatar.isNotEmpty
        ? userInfo.avatar
        : 'https://img0.baidu.com/it/u=3979949991,2513156939&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500';
    if (!userImage.startsWith('http')) {
      userImage = Config.BaseUrl + userImage;
    }
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      decoration: const BoxDecoration(color: Colors.green),
      height: 95.0,
      child: Row(
        children: [
          Container(
            height: 65.0,
            width: 65.0,
            margin: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.only(top: 10)),
              Text(userName, style: loginRegisterStyle),
              const Text('查看编辑个人资料', style: TextStyle(color: Colors.white))
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var isLogin = ScopedModelHelper.getModel<AuthModel>(context).isLogin;
    return isLogin ? _loginBuilder(context) : _notLoginBuilder(context);
  }
}
