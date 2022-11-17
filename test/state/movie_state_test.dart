import 'package:flutter_starter_private/mobx/movie/movie_state.dart';
import 'package:flutter_starter_private/model/movie_detail_model.dart';
import 'package:flutter_starter_private/model/movie_list_response.dart';
import 'package:flutter_starter_private/repository/movie_repository.dart';
import 'package:flutter_starter_private/utils/future_delayer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mocktail/mocktail.dart';

import '../model/movie_detail_model_test.dart' as detailModel;
import '../model/movie_list_model_test.dart' as listModel;

class MockMovieRepository extends Mock implements MovieRepositoryImpl {}

void main() {
  late MockMovieRepository mockRepo = MockMovieRepository();
  late MovieState mockState = MovieState(movieRepo: mockRepo);
  late ListMovieResponse mockModelList = ListMovieResponse.fromJson(listModel.mockListMovie);
  late MovieDetailResponse mockModelDetail = MovieDetailResponse.fromJson(detailModel.mockDetailMovie);
  // add random for new request
  late final movieRequest = MovieData.fromJson(listModel.mockListMovie['results'][0]).copyWith(id: 12  );

  // setUp(() {
  //   mockRepo = MockMovieRepository();
  //   mockState = MovieState(movieRepo: mockRepo);
  //   mockModelList = ListMovieResponse.fromJson(listModel.mockListMovie);
  //   mockModelDetail = MovieDetailResponse.fromJson(detailModel.mockDetailMovie);
  // });
  group(
    "check each function",
    () {
      mobx.ReactionDisposer reaction<T>(T state, void Function(T data) effect) {
        return mobx.reaction((p0) => state, effect);
      }

      test(
        "check get List Movie",
        () async {
          when(() => mockRepo.fetchListMovie()).thenAnswer((_) => mockModelList.toWait(const Duration(seconds: 1)));
          expect(mockState.isLoading, false);
          final dispose = reaction(mockState.isLoading, (p0) {
            expect(mockState.isLoading, true);
          });
          final future = mockState.getListMovie();
          await future;
          dispose();
          expect(mockState.listMovie[0], mockModelList.results[0]);
          expect(mockState.isLoading, false);
        },
      );
      test(
        "check list movie for second page",
        () async {
          when(() => mockRepo.fetchListMovie(2)).thenAnswer((_) => mockModelList.toWait(const Duration(seconds: 1)));
          expect(mockState.isLoading, false);
          final dispose = reaction(mockState.isLoading, (p0) {
            expect(mockState.isLoading, true);
          });
          final future = mockState.getListMovie(2);
          await future;
          dispose();
          expect(mockState.listMovie.length, mockModelList.results.length * 2);
          expect(mockState.isLoading, false);
        },
      );

      test(
        "check get detail Movie",
        () async {
          when(() => mockRepo.fetchDetailMovie('1')).thenAnswer((_) => mockModelDetail.toWait(const Duration(seconds: 1)));
          expect(mockState.isLoading, false);
          final dispose = reaction(mockState.isLoading, (p0) {
            expect(mockState.isLoading, true);
          });
          final future = mockState.getDetailMovie(1);
          await future;
          dispose();
          expect(mockState.movieDetail, mockModelDetail);
          expect(mockState.isLoading, false);
        },
      );
      test(
        "check favorit list movie",
        () async {
          when(() => mockRepo.fetchAllFavorit()).thenAnswer((_) => mockModelList.results.toWait(const Duration(seconds: 1)));
          expect(mockState.isLoading, false);
          final dispose = reaction(mockState.isLoading, (p0) {
            expect(mockState.isLoading, true);
          });
          final future = mockState.getFavoritMovie();
          await future;
          dispose();
          expect(mockState.listFavorit, mockModelList.results);
          expect(mockState.isLoading, false);
        },
      );

      test(
        "check computed value",
        () async {
          final popular = mockState.indexPopular;
          final lenFavorit = mockState.listFavorit.length;
          // karena cuma copy paste favorit dan list movie
          expect(popular, [for (var i = 0; i < lenFavorit; i++) i]);
        },
      );

      test(
        "add favorit",
        () async {
          final lenFavorit = mockState.listFavorit.length;
          when(() => mockRepo.postFavorite(movieRequest)).thenAnswer((_) => true.toWait(const Duration(seconds: 1)));
          expect(mockState.isLoading, false);
          final dispose = reaction(mockState.isLoading, (p0) {
            expect(mockState.isLoading, true);
          });
          final future = mockState.addFavorite(movieRequest);
          await future;
          dispose();
          expect(mockState.isLoading, false);
          expect(mockState.listFavorit.length, lenFavorit + 1);
        },
      );
      test(
        "remove favorit",
        () async {
          final lenFavorit = mockState.listFavorit.length;
          when(() => mockRepo.deleteFavorite(movieRequest.id)).thenAnswer((_) => true.toWait(const Duration(seconds: 1)));
          expect(mockState.isLoading, false);
          final dispose = reaction(mockState.isLoading, (p0) {
            expect(mockState.isLoading, true);
          });
          final future = mockState.removeFavorite(movieRequest.id);
          await future;
          dispose();
          expect(mockState.isLoading, false);
          expect(mockState.listFavorit.length, lenFavorit - 1);
        },
      );
    },
  );
}
