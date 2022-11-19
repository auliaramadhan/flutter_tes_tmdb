import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_starter_private/components/card_movie.dart';
import 'package:flutter_starter_private/model/movie_list_response.dart';
import 'package:flutter_starter_private/repository/movie_repository.dart';
import 'package:flutter_starter_private/utils/future_delayer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import '../test/model/movie_list_model_test.dart' as listModel;
import '../lib/main.dart' as app;

class MockMovieRepository extends Mock implements MovieRepositoryImpl {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final ListMovieResponse mockModelList = ListMovieResponse.fromJson(listModel.mockListMovie);
  final MockMovieRepository mockRepo = MockMovieRepository();

  Future<void> fillMock() async {
    HttpOverrides.global = null;
    // when(() => mockRepo.fetchListMovie(1)).thenAnswer(
    //   (_) => mockModelList.toWait(const Duration(seconds: 1)),
    // );
  }

  testWidgets(
    "test my app",
    (WidgetTester tester) async {
      fillMock();
      app.main();
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 5));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('0')), findsOneWidget);

      // tap the first favorite
      final icon = find.byIcon(Icons.favorite);
      await tester.tap(icon.first);
      await tester.pump(Duration(seconds: 2));
      await tester.pumpAndSettle();

      // go  to movie deatil page  in the first
      final tapCard = find.byKey(const Key('0'));
      await tester.tap(tapCard.first);
      await tester.pump(Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('MovieDetailPage')), findsOneWidget);

      /// go back to movie page list
      /// ok ternyata ini pake appbar backbuttom
      /// jadi ga bisa di windows kalo ga pake appbar
      await tester.pageBack();
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('MovieDetailPage')), findsNothing);
    },
  );
}
