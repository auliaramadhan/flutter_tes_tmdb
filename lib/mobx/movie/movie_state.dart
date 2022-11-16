import 'package:flutter/foundation.dart';
import 'package:flutter_starter_private/model/movie_detail_model.dart';
import 'package:flutter_starter_private/model/movie_list_response.dart';
import 'package:flutter_starter_private/repository/movie_repository.dart';
import 'package:mobx/mobx.dart';

part 'movie_state.g.dart';

class MovieState = _MovieState with _$MovieState;

abstract class _MovieState with Store {
  final MovieRepository movieRepo;

  @observable
  MovieDetailResponse? movieDetail;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<MovieData> listMovie = ObservableList<MovieData>();

  @observable
  ObservableList<MovieData> listFavorit = ObservableList<MovieData>();

  @computed
  Set<int> get indexPopular {
    final listIndex = Set<int>();
    for (var data in listFavorit) {
      final index = listMovie.indexWhere((element) => element.id == data.id);
      listIndex.add(index);
    }
    return listIndex;
  }

  _MovieState({
    required this.movieRepo,
  });

  @action
  Future<bool> getDetailMovie(int id) async {
    isLoading = true;
    try {
      final movieDetailResponse = await movieRepo.fetchDetailMovie(id.toString());
      movieDetail = movieDetailResponse;
    } catch (e) {
      print(e);
    }
    isLoading = false;
    return true;
  }

  @action
  Future<bool> getListMovie([int page = 1]) async {
    isLoading = true;
    try {
      if (page == 1) {
        listMovie.clear();
      }
      final list = await movieRepo.fetchListMovie(page);
      listMovie.addAll(list.results);
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
    return true;
  }

  @action
  Future<bool> getFavoritMovie() async {
    isLoading = true;
    try {
      final list = await movieRepo.fetchAllFavorit();
      listFavorit.addAll(list);
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
    return true;
  }

  @action
  Future<bool> addFavorite(MovieData movie) async {
    if (listFavorit.any((element) => element.id == movie.id)) {
      return false;
    }
    isLoading = true;
    try {
      final success = await movieRepo.postFavorite(movie);
      if (success) {
        listFavorit.add(movie);
      } else {}
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
    return true;
  }

  @action
  Future<bool> removeFavorite(int id) async {
    final index = listFavorit.indexWhere((element) => element.id == id);
    if (index == -1) {
      return false;
    }
    isLoading = true;
    try {
      final success = await movieRepo.deleteFavorite(id);
      if (success) {
        listFavorit.removeAt(index);
      } else {}
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
    return true;
  }
}
