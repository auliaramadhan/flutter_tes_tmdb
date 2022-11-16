// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieState on _MovieState, Store {
  Computed<Set<int>>? _$indexPopularComputed;

  @override
  Set<int> get indexPopular =>
      (_$indexPopularComputed ??= Computed<Set<int>>(() => super.indexPopular,
              name: '_MovieState.indexPopular'))
          .value;

  late final _$movieDetailAtom =
      Atom(name: '_MovieState.movieDetail', context: context);

  @override
  MovieDetailResponse? get movieDetail {
    _$movieDetailAtom.reportRead();
    return super.movieDetail;
  }

  @override
  set movieDetail(MovieDetailResponse? value) {
    _$movieDetailAtom.reportWrite(value, super.movieDetail, () {
      super.movieDetail = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_MovieState.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$listMovieAtom =
      Atom(name: '_MovieState.listMovie', context: context);

  @override
  ObservableList<MovieData> get listMovie {
    _$listMovieAtom.reportRead();
    return super.listMovie;
  }

  @override
  set listMovie(ObservableList<MovieData> value) {
    _$listMovieAtom.reportWrite(value, super.listMovie, () {
      super.listMovie = value;
    });
  }

  late final _$listPopularAtom =
      Atom(name: '_MovieState.listPopular', context: context);

  @override
  ObservableList<MovieData> get listPopular {
    _$listPopularAtom.reportRead();
    return super.listPopular;
  }

  @override
  set listPopular(ObservableList<MovieData> value) {
    _$listPopularAtom.reportWrite(value, super.listPopular, () {
      super.listPopular = value;
    });
  }

  late final _$getDetailMovieAsyncAction =
      AsyncAction('_MovieState.getDetailMovie', context: context);

  @override
  Future<bool> getDetailMovie(int id) {
    return _$getDetailMovieAsyncAction.run(() => super.getDetailMovie(id));
  }

  late final _$getListMovieAsyncAction =
      AsyncAction('_MovieState.getListMovie', context: context);

  @override
  Future<bool> getListMovie([int page = 1]) {
    return _$getListMovieAsyncAction.run(() => super.getListMovie(page));
  }

  late final _$getPopularsMovieAsyncAction =
      AsyncAction('_MovieState.getPopularsMovie', context: context);

  @override
  Future<bool> getPopularsMovie() {
    return _$getPopularsMovieAsyncAction.run(() => super.getPopularsMovie());
  }

  late final _$addFavoriteAsyncAction =
      AsyncAction('_MovieState.addFavorite', context: context);

  @override
  Future<bool> addFavorite(MovieData movie) {
    return _$addFavoriteAsyncAction.run(() => super.addFavorite(movie));
  }

  @override
  String toString() {
    return '''
movieDetail: ${movieDetail},
isLoading: ${isLoading},
listMovie: ${listMovie},
listPopular: ${listPopular},
indexPopular: ${indexPopular}
    ''';
  }
}
