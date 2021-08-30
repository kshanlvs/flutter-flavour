import 'dart:async';

import 'package:dio/dio.dart';
import 'package:tasktwo/app/networking/api.dart';

class UserRepository {
  Completer completer = Completer();

  Future getUserData() async {
    Response response = await Api().get(
      '/users',
    );

    if (response.statusCode == 200) {
      completer.complete(response.data);
    }

    return completer.future;
  }
}
