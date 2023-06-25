import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/data/data_sources/local/auth_local_data_src.dart';

import 'base_servie.dart';

@Singleton()
class DioInterceptor {
  DioInterceptor(this._authLocalDataSrc);

  final AuthLocalDataSrc _authLocalDataSrc;

  Future<Dio> addInterceptor(Dio dio) async {
    //String query = "";
    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: ((options, handler) async {
          final bearerToken = await _authLocalDataSrc.getAccessToken();
          options.headers
              .putIfAbsent('Authorization', () => 'Bearer $bearerToken');
          handler.next(options);
        }),
        onResponse: ((response, handler) async {
          handler.next(response);
        }),
        onError: (e, handler) async {
          if (e.response?.statusCode == 401) {
            _handleAccessTokenExpired(dio);

            //recall request:
            final String? accessToken =
                await _authLocalDataSrc.getAccessToken();
            e.requestOptions.headers
                .putIfAbsent('Authorization', () => 'Bearer $accessToken');
            final opts = Options(
                method: e.requestOptions.method,
                headers: e.requestOptions.headers);
            final cloneReq = await dio.request(e.requestOptions.path,
                options: opts,
                data: e.requestOptions.data,
                queryParameters: e.requestOptions.queryParameters);
            return handler.resolve(cloneReq);
          }
          handler.next(e);
        },
      ),
    );
    return dio;
  }

  Future<void> _handleAccessTokenExpired(Dio dio) async {
    try {
      final refreshToken = await _authLocalDataSrc.getRefreshToken();
      if (refreshToken != null) {
        final res = await dio.post("${BaseService.authPath}/access-token",
            data: {"refresh_token": refreshToken});
        if (res.statusCode == 200) {
          final newAccessToken = res.data["data"]["token"];
          await _authLocalDataSrc.saveAuth(newAccessToken, refreshToken);
          // await _authLocal.set ;
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

// static Future<Dio> addInterceptorRefreshToken(Dio dio) async {
//   dio.interceptors.add(
//     QueuedInterceptorsWrapper(
//       onRequest: ((options, handler) async {
//         options.headers["uuid"] = "abc";
//         options.headers["platform"] = "userApp";
//         options.headers["refreshToken"] = await HiveAuth().getRefreshToken();
//         handler.next(options);
//       }),
//       onResponse: ((response, handler) async {
//         //save new access token and refresh token
//         final String newAccessToken = response.headers["newaccesstoken"]![0];
//         final String newRefreshToken =
//             response.headers["newrefreshtoken"]![0];
//         await HiveAuth().saveAuth(newAccessToken, newRefreshToken);
//         handler.next(response);
//       }),
//     ),
//   );
//   return dio;
// }
}
