import 'package:dio/dio.dart';

class BaseService {
  late Dio dio;

  // api route
  //static const String GET_ABC = "/abc";
  BaseService() {
    dio = Dio(
      BaseOptions(
          baseUrl: "https",
          connectTimeout: const Duration(milliseconds: 10000),
          receiveTimeout: const Duration(milliseconds: 10000),
          responseType: ResponseType.json,
          contentType: Headers.jsonContentType,
          headers: {
            // "authorization": "Bearer ${GlobalData.ins.localToken}",
          }),
    );
  }
}
