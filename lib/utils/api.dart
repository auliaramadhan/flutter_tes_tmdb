import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_starter_private/utils/api_url.dart';
import 'package:flutter_starter_private/utils/custom_interceptor.dart';
import 'package:flutter_starter_private/utils/storage_helper.dart';

class HttpClient {
  late Dio dio;
  late Dio tokenDio;

  HttpClient() {
    dio = Dio(); // with default Options
    tokenDio = Dio(BaseOptions());

    // Set default configs
    dio.options.baseUrl = ApiUrl.BASE_URL;
    dio.options.connectTimeout = 30000; //15s
    dio.options.receiveTimeout = 30000;
    dio.options.headers[HttpHeaders.contentTypeHeader] = "application/json";

    dio.interceptors.addAll({
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Do something before request is sent
          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: `handler.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: `handler.reject(dioError)`
        },
        onResponse: (response, handler) {
          // Do something with response data
          return handler.next(response); // continue
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: `handler.reject(dioError)`
        },
        onError: (DioError e, handler) {
          // Do something with response error
          return handler.next(e); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: `handler.resolve(response)`.
        },
      ),
      /// same as intercept wrapper but good for sequentially handle request
      /// good for handle token
      /// QueuedInterceptorsWrapper(
      ///   onError: (e, handler) {},
      ///   onRequest: (options, handler) {},
      ///   onResponse: (e, handler) {},
      /// ),
      if (kDebugMode) LogInterceptor(responseBody: true, requestBody: true),
      AppInterceptors(dio)
    });
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(requestOptions.path, data: requestOptions.data, queryParameters: requestOptions.queryParameters, options: options);
  }

  Future<dynamic> post(
    String path,
    body, {
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    try {
      options = options ?? Options(method: 'POST');
      final response = await dio.request(path, data: body, options: options);
      return response.data;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    try {
      final response = await dio.request(path, queryParameters: query, options: Options(method: 'GET'));
      return response.data;
    } catch (e) {
      return e;
    }
  }
}
