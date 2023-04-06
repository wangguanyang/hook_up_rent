import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/index.dart';
import 'package:hook_up_rent/pages/home/room_add/index.dart';
import 'package:hook_up_rent/pages/home/room_manage/index.dart';
import 'package:hook_up_rent/pages/home/setting.dart';
import 'package:hook_up_rent/pages/loading.dart';
import 'package:hook_up_rent/pages/login.dart';
import 'package:hook_up_rent/pages/not_found.dart';
import 'package:hook_up_rent/pages/register.dart';
import 'package:hook_up_rent/pages/home/room_detail/index.dart';

// 跳转实现函数,构造函数中使用const可以提高性能
var homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const HomePage();
});

var loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return LoginPage();
});

var registerHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return RegisterPage();
});

var settingHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return SettingPage();
});

var roomManageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return RoomManagePage();
});

var roomAddHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return RoomAddPage();
});

var roomDetailHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  final String roomIdStr = params["roomId"]![0];
  return RoomDetailPage(
    roomId: roomIdStr,
  );
});

var loadingHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return LoadingPage();
});
// 空页面
var notFoundHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const NotFoundPage();
});

class Routes {
  // 定义路由名称
  static String home = '/';
  static String login = '/login';
  static String register = '/register';
  static String roomDetail = '/roomDetail/:roomId';
  static String setting = '/setting';
  static String roomManage = '/roomManage';
  static String roomAdd = '/roomAdd';
  static String loading = '/loading';

// 编写函数 configureRoutes 管理路由名称和处理函数
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });

    router.define(home, handler: homeHandler);
    router.define(login, handler: loginHandler);
    router.define(roomDetail, handler: roomDetailHandler);
    router.define(register, handler: registerHandler);
    router.define(setting, handler: settingHandler);
    router.define(roomManage, handler: roomManageHandler);
    router.define(roomAdd, handler: roomAddHandler);
    router.define(loading, handler: loadingHandler  );
    router.notFoundHandler = notFoundHandler;
  }
}
