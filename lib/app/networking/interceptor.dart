import 'package:dio/dio.dart';

import 'package:get_storage/get_storage.dart';

class CustomInterceptor extends Interceptor {
  GetStorage storage = GetStorage();
  String? accessToken = "";
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
