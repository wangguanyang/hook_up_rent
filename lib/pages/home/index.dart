// 1.新建文件pages/home/index.dart
// 2.添加material, page_content依赖
import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/info/index.dart';
import 'package:hook_up_rent/pages/home/tab_info/index.dart';
import 'package:hook_up_rent/pages/home/tab_search/data_list.dart';
import 'package:hook_up_rent/pages/home/tab_search/index.dart';
import 'package:hook_up_rent/widgets/page_content.dart';
import 'package:hook_up_rent/pages/home/tab_index/index.dart';
import 'tab_profile/index.dart';

// tableList
List<Widget> tableList = [
  const TabIndex(),
  const TabSearch(),
  const TabInfo(),
  const TabProfile(),
];
// BottomNavigationBarItem
List<BottomNavigationBarItem> barItemList = [
  const BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
  const BottomNavigationBarItem(icon: Icon(Icons.search), label: '搜索'),
  const BottomNavigationBarItem(icon: Icon(Icons.info), label: '资讯'),
  const BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: '我的'),
];

// 3.编写无状态组件
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

//  BottomNavigationBarItem 点击事件
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tableList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: barItemList,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
