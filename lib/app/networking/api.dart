import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:tasktwo/app/networking/interceptor.dart';

class Api extends DioForNative {
  Api() {
    
    options.baseUrl =
        "https://jsonplaceholder.typicode.com"; 

    options.connectTimeout = 15000 * 60;
    options.receiveTimeout = 15000 * 60;
    CustomInterceptor refreshFlow = CustomInterceptor();
    interceptors.add(refreshFlow);
    interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
}
