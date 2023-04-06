import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:hook_up_rent/config.dart';

class  DioHttp {
  Dio? _client;
  late BuildContext context;

  static DioHttp of(BuildContext context) {
    return DioHttp._internal(context);
  }

  DioHttp._internal(BuildContext context) {
    if (_client == null || context != this.context) {
      this.context = context;
      final options = BaseOptions(
          baseUrl: Config.BaseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 3),
          extra: {'context': context});

      final client = Dio(options);
      _client = client;
    }
  }

  //  Get 请求
  Future<Response<Map<String, dynamic>>> get( String path,
      [Map<String, dynamic>? params, String? token]) async {
    final options = Options(headers: {'Authorization': token});
    return await _client!.get(path, queryParameters: params, options: options);
  }

  //  Post 请求
  Future<Response<Map<String, dynamic>>> post(String path,
      [Map<String, dynamic>? params, String? token]) async {
    final options = Options(headers: {'Authorization': token});
    return await _client!.post(path, data: params, options: options);
  }
  // postFormData 
  Future<Response<Map<String, dynamic>>> postFormData(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token},contentType: 'mutipart/form-data');
    return await _client!.post(path, data: params, options: options);
  }
}
