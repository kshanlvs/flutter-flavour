import 'package:dio/dio.dart';

import 'package:get_storage/get_storage.dart';

class CustomInterceptor extends Interceptor {
  GetStorage storage = GetStorage();
  String? accessToken = "";
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // await getToken();
    // await ifTokenIsNull();
    // options.headers["Authorization"] = "Bearer $accessToken";
    // options.headers["x-request-id"] = 'request-id';
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

  // -----------------------------------------------------------------------------------------

  // // getToken from getstorage
  // getToken() async {
  //   accessToken = storage.read('token');
  // }

  // // if token is null call logout function
  // ifTokenIsNull({RequestOptions? options}) async {
  //   if (accessToken == null || accessToken == "") {
  //     if (options?.path != "/getOtp" && options?.path != "/login-mobile") {
  //       await logout();
  //     }
  //   }
  // }

  // clear token from storage and then go to auth view
  // logout() async {
  //   await clearAccessTokenFromGetSTorage();
  //   await goToAuthViewScreen();
  // }

  // // clearing getstoreage
  // clearAccessTokenFromGetSTorage() async {
  //   storage.erase();
  // }

  // // route to authView
  // goToAuthViewScreen() {
  //   getX.Get.toNamed(Routes.AUTH);
  // }
}
