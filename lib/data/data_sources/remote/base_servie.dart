import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/config/app_config.dart';

import '../local/auth_local_data_src.dart';
import 'dio_interceptor.dart';

@Singleton()
class BaseService {
  late Dio dio;
  final AuthLocalDataSrc authLocalDataSrc;
  final DioInterceptor interceptor;

  // api route
  static const String authLoginWithFirebasePath = "/auth/login-with-firebase";
  static const String userPath = "/user";

  BaseService({required this.authLocalDataSrc, required this.interceptor}) {
    initDio();
  }

  Future<Dio> initDio() async {
    dio = Dio(
      BaseOptions(
          baseUrl: AppConfig.baseUrl,
          connectTimeout: const Duration(milliseconds: 10000),
          receiveTimeout: const Duration(milliseconds: 10000),
          responseType: ResponseType.json,
          contentType: Headers.jsonContentType,
          headers: {
            // "authorization": "Bearer ${GlobalData.ins.localToken}",
          }),
    );
    dio = await interceptor.addInterceptor(dio);
    return dio;
  }
}
