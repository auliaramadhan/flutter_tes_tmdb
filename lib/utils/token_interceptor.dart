
import 'package:dio/dio.dart';

class TokenInterceptor extends QueuedInterceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }
}