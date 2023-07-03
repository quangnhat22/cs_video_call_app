import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/config/app_config.dart';

import 'dio_interceptor.dart';

@Singleton()
class BaseService {
  late Dio dio;
  final DioInterceptor interceptor;

  // api route
  static const String authPath = "/auth";
  static const String userPath = "/user";
  static const String friendPath = "/friend";
  static const String groupPath = "/group";
  static const String callPath = "/call";
  static const String groupCallPath = "/meeting";
  static const String searchPath = "/search";
  static const String devicePath = "/device";
  static const String messagePath = "/message";

  BaseService({required this.interceptor}) {
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
