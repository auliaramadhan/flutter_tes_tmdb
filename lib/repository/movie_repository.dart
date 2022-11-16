import 'package:dio/dio.dart';
import 'package:flutter_starter_private/db/movie_database.dart';
import 'package:flutter_starter_private/model/movie_detail_model.dart';
import 'package:flutter_starter_private/model/movie_list_response.dart';
import 'package:flutter_starter_private/utils/api_url.dart';
import 'package:flutter_starter_private/model/GeneralRequest.dart';
import 'package:flutter_starter_private/model/GeneralResponse.dart';
import 'package:flutter_starter_private/utils/api.dart';
import 'package:flutter_starter_private/utils/future_delayer.dart';

abstract class MovieRepository {
  Future<ListMovieResponse> fetchListMovie([int? page]);
  Future<MovieDetailResponse> fetchDetailMovie(String id);

  Future<List<MovieData>> fetchAllPopular();
  Future<bool> postFavorite(MovieData movie);
  Future<MovieData> updateMovie(MovieData movie);
  Future<MovieData> postMovie(MovieData movie);
}

class MovieRepositoryImpl implements MovieRepository {
  final httpClient = HttpClient();

  @override
  fetchListMovie([page = 1]) async {
    final query = {
      "api_key": ApiUrl.API_KEY,
      "language": 'en-US',
      "page": page,
    };
    final rawResponse = await httpClient.get(ApiUrl.POPULAR_MOVIE, query: query);
    if (rawResponse is DioError) {
      throw rawResponse;
    }
    return ListMovieResponse.fromJson(rawResponse);
  }

  @override
  fetchDetailMovie(id) async {
    final query = {
      "api_key": ApiUrl.API_KEY,
      "language": 'en-US',
    };
    final rawResponse = await httpClient.get(ApiUrl.MOVIE + id, query: query);
    if (rawResponse is DioError) {
      throw rawResponse;
    }
    return MovieDetailResponse.fromJson(rawResponse);
  }

  @override
  fetchAllPopular() async {
    await FutureDelayer.delayBy1000();
    final listMovie = await MovieFavoriteDatabase.instance.readAllMovie();
    return listMovie;
  }

  @override
  postFavorite(movie) async {
    await FutureDelayer.delayBy1000();
    await MovieFavoriteDatabase.instance.create(movie);
    return true;
  }
  
  @override
  Future<MovieData> postMovie(MovieData movie) {
    // TODO: implement postMovie
    throw UnimplementedError();
  }
  
  @override
  Future<MovieData> updateMovie(MovieData movie) {
    // TODO: implement updateMovie
    throw UnimplementedError();
  }
  
}
