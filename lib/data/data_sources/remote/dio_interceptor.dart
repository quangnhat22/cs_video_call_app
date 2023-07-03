import 'package:dio/dio.dart';
import 'package:videocall/data/data_sources/local/auth_local_data_src.dart';
import 'package:videocall/data/data_sources/local/local_data_src.dart';

import 'base_servie.dart';

class DioInterceptor extends QueuedInterceptorsWrapper {
  DioInterceptor(this._authLocalDataSrc, this._localDataSource, this._dio);

  final AuthLocalDataSrc _authLocalDataSrc;
  final LocalDataSource _localDataSource;
  late final Dio _dio;

  Future<Map<String, String>> _accessToken() async {
    final token = await _authLocalDataSrc.getAccessToken();
    return {'Authorization': 'Bearer $token'};
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll(await _accessToken());
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    // Go Next when call api login || refreshToken
    if (err.requestOptions.path.contains('register') ||
        err.requestOptions.path.contains('login-with-firebase') ||
        err.requestOptions.path.contains('login') ||
        err.requestOptions.path.contains('access-token')) {
      return handler.next(err);
    }
    // Do something with response error
    if (err.response?.statusCode == 401) {
      final isHasToken = await _refreshToken();
      if (!isHasToken) {
        return handler.next(err);
      }

      err.requestOptions.headers.remove('Authorization');
      err.requestOptions.headers.addAll(await _accessToken());

      final opts = Options(
        headers: err.requestOptions.headers,
        method: err.requestOptions.method,
      );

      final cloneReq = await _dio.request(
        err.requestOptions.path,
        options: opts,
        data: err.requestOptions.data,
        queryParameters: err.requestOptions.queryParameters,
        onSendProgress: err.requestOptions.onSendProgress,
        onReceiveProgress: err.requestOptions.onReceiveProgress,
        cancelToken: err.requestOptions.cancelToken,
      );
      if (cloneReq.statusCode! >= 200 && cloneReq.statusCode! <= 299) {
        return handler.resolve(cloneReq);
      } else {
        return handler
            .reject(DioError(requestOptions: err.response!.requestOptions));
      }
    }
    return handler.next(err);
  }

  Future<bool> _refreshToken() async {
    final newDio = BaseService.initDio();
    try {
      final refreshToken = await _authLocalDataSrc.getRefreshToken();
      if (refreshToken == null) return false;

      final res = await newDio.post("${BaseService.authPath}/access-token",
          data: {"refresh_token": refreshToken});
      if (res.statusCode == 200) {
        final newAccessToken = res.data["data"]["token"];
        await _authLocalDataSrc.saveAuth(newAccessToken, refreshToken);
      } else {
        _localDataSource.deleteAllLocal();
      }

      newDio.close(force: true);
      return (res.statusCode! >= 200 && res.statusCode! <= 299);
    } catch (_) {
      newDio.close(force: true);

      return false;
    }
  }
}
