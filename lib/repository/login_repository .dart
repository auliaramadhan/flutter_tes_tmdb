import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_starter_private/model/login_data.dart';
import 'package:flutter_starter_private/utils/api_url.dart';
import 'package:flutter_starter_private/utils/api.dart';

abstract class LoginRepository {
  Future<UserData> postLogin(String username, String password);
}

class LoginRepositoryImpl extends LoginRepository {
  final httpClient = HttpClient();

  @override
  postLogin(username, password) async {
    final rawResponse = await httpClient.post(
      ApiUrl.LOGIN,
      FormData.fromMap({
        'username': username,
        'password': password,
      }),
    );
    if (rawResponse is DioError) {
      throw rawResponse;
    }
    return UserData.fromJson(jsonDecode(rawResponse));
  }
}
