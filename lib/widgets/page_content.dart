// 添加依赖
import 'package:flutter/material.dart';
import 'package:hook_up_rent/routs.dart';


// 无状态组件
class PageContent extends StatelessWidget {
  final String name;
// 添加 name 参数
  const PageContent({super.key, required this.name});
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("当前页面:$name"),
      ),
      body: ListView(children: <Widget>[
        TextButton(
          onPressed: () => Navigator.pushNamed(context, Routes.home),
          child: Text(Routes.home),
      ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, Routes.login),
          child: Text(Routes.login),
      ),
      TextButton(
          onPressed: () => Navigator.pushNamed(context, "/aaaa"),
          child: Text("访问不存在的页面"),
      ),
       TextButton(
          onPressed: () => Navigator.pushNamed(context, "/room/2222"),
          child: Text("房屋详情,id:2222"),
      ),
      ],
      ),
    );
  }
  

}




// 使用Scanffold