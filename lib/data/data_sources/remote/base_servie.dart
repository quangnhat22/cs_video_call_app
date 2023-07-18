import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/config/app_config.dart';
import 'package:videocall/data/data_sources/local/auth_local_data_src.dart';
import 'package:videocall/data/data_sources/local/local_data_src.dart';

import 'dio_interceptor.dart';

@Singleton()
class BaseService {
  late final Dio dio;
  final AuthLocalDataSrc _authLocalDataSrc;
  final LocalDataSource _localDataSource;

  // api route
  static const String authPath = "/auth";
  static const String userPath = "/user";
  static const String friendPath = "/friend";
  static const String groupPath = "/group";
  static const String callPath = "/call";
  static const String groupCallPath = "/meeting";
  static const String searchPath = "/search";
  static const String devicePath = "/device";
  static const String notificationPath = "/notification";
  static const String messagePath = "/message";

  BaseService(this._authLocalDataSrc, this._localDataSource) {
    dio = initDio();
    dio.interceptors.add(DioInterceptor(
      _authLocalDataSrc,
      _localDataSource,
      dio,
    ));
  }

  static Dio initDio() {
    final dio = Dio(
      BaseOptions(
          baseUrl: AppConfig.apiUrl,
          connectTimeout: const Duration(milliseconds: 10000),
          receiveTimeout: const Duration(milliseconds: 10000),
          responseType: ResponseType.json,
          contentType: Headers.jsonContentType,
          headers: {
            // "authorization": "Bearer ${GlobalData.ins.localToken}",
          }),
    );
    return dio;
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
