import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';

class DataClient {
  Dio dio;
  static DataClient _inst;

  DataClient._internal(String baseUrl) {
    dio = new Dio(new BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 100000,
      receiveTimeout: 300000,
     // headers: map,
    ));
  }

  setHeaders({Map<String, String> map}) {
    if (dio != null && map.isNotEmpty) {
      for (var i = 0; i < map.length; i++) {
        for (var key in map.keys) {
          dio.options.headers[key] = map[key];
        }
      }
    }
  }

  factory DataClient(String baseUrl) {
    if (_inst == null) {
      _inst = new DataClient._internal(baseUrl);
    }
    if (_inst != null && _inst.dio != null) {
      _inst.dio.options.baseUrl = baseUrl;
     // _inst.dio.options.headers = map;
    }
    return _inst;
  }
}
