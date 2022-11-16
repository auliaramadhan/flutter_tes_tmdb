import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_starter_private/model/movie_list_response.dart';
import 'package:flutter_starter_private/utils/api_url.dart';
import 'package:flutter_starter_private/model/GeneralRequest.dart';
import 'package:flutter_starter_private/model/GeneralResponse.dart';
import 'package:flutter_starter_private/utils/api.dart';
import 'package:flutter_starter_private/utils/future_delayer.dart';

abstract class ExampleRepository {
  Future<GeneralResponse> fetchExample(GeneralRequest request);
  Future<ListMovieResponse> fetchMovie();
  Future<int> fetchRandom();
}

class ExampleRepositoryImpl implements ExampleRepository {
  final httpClient = HttpClient();

  @override
  Future<GeneralResponse> fetchExample(GeneralRequest request) async {
    final rawResponse = await httpClient.post(ApiUrl.EXAMPLE, request);
    if (rawResponse is DioError){
      throw rawResponse;
    }
    return GeneralResponse.fromJson(rawResponse);
  }
  @override
  Future<ListMovieResponse> fetchMovie() async {
    final query = {
      "api_key": ApiUrl.API_KEY,
      "language": 'en-US',
      "page": 1,
    };
    final rawResponse = await httpClient.get(ApiUrl.POPULAR_MOVIE, query: query);
    if (rawResponse is DioError) {
      throw rawResponse;
    }
    return ListMovieResponse.fromJson(rawResponse);
  }
  
  @override
  Future<int> fetchRandom() async{
    await FutureDelayer.delayBy1000();
    final random =  Random().nextInt(100);
    return random;
  } 
}