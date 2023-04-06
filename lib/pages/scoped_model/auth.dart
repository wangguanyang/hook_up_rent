import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:hook_up_rent/models/user_info.dart';
import 'package:hook_up_rent/pages/utils/dio_http.dart';
import 'package:hook_up_rent/pages/utils/store.dart';
import 'package:scoped_model/scoped_model.dart';

class AuthModel extends Model {
  String _token = '';
  String get token => _token;
  late UserInfo _userInfo;
  UserInfo get userInfo => _userInfo;

  // ignore: unnecessary_type_check
  bool get isLogin => _token is String && _token.isNotEmpty;
  void initApp(BuildContext context) async {
    Store store = await Store.getInstance();
    String token = await store.getString(StoreKeys.token);
    if (token.isNotEmpty) {
      //  当前widget挂载在BuildContext时
      if (context.mounted) {
        login(token, context);
      }
    }
  }

  _getUserInfo(BuildContext context) async {
    const url = '/user';
    var res = await DioHttp.of(context).get(url, null, _token);
    var resMap = json.decode(res.toString());
    var data = resMap['body'];
    var userInfo = UserInfo.fromJson(data);
    _userInfo = userInfo;
    notifyListeners();
  }

  void login(String token, BuildContext context) {
    _token = token;
    notifyListeners();
    _getUserInfo(context);
  }

  Future<void> logout() async {
    _token = '';
    Store store = await Store.getInstance();
    await store.setString(StoreKeys.token, '');
    _userInfo = UserInfo.fromJson({});
    notifyListeners();
  }
}
