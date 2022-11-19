import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_starter_private/helper/size_config.dart';
import 'package:flutter_starter_private/mobx/movie/movie_state.dart';
import 'package:flutter_starter_private/model/movie_list_response.dart';
import 'package:flutter_starter_private/myapp.dart';
import 'package:flutter_starter_private/page/example/example_page.dart';
import 'package:flutter_starter_private/page/movie_list/movie_list_page.dart';
import 'package:flutter_starter_private/repository/movie_repository.dart';
import 'package:flutter_starter_private/utils/future_delayer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:provider/provider.dart';

import '../model/movie_list_model_test.dart' as listModel;

class MockMovieRepository extends Mock implements MovieRepositoryImpl {}

void main() {
  late MockMovieRepository mockRepo;
  late ListMovieResponse mockModelList;

  setUp(
    () {
      mockModelList = ListMovieResponse.fromJson(listModel.mockListMovie);
      mockRepo = MockMovieRepository();
    },
  );

  Future<Widget> createWidgetUnderTest() async {
    await dotenv.load(fileName: ".env");

    return Provider(
      create: (context) => MovieState(
        movieRepo: mockRepo,
      ),
      child: MaterialApp(
        home: Builder(builder: (context) {
          SizeConfig().init(context);
          return MovieListPage();
        }),
      ),
    );
  }

  mobx.ReactionDisposer reaction<T>(T state, void Function(T data) effect) {
    return mobx.reaction((p0) => state, effect);
  }

  Future<void> fillMock() async {
    when(() => mockRepo.fetchListMovie(1)).thenAnswer(
      (_) => mockModelList.toWait(const Duration(seconds: 1)),
    );
  }

  testWidgets(
    "test if data shown within 1 second",
    (WidgetTester tester) async {
      // await fillMock();
      // kalo ada semacam future atau timer pakai ini
      // image bermasalah karena http diiverride jadi ga bisa fetch image
      when(() => mockRepo.fetchListMovie()).thenAnswer(
        (_) => mockModelList.copyWith(results: [
          MovieData.fromJson(
            listModel.mockListMovie['results'][0],
          )
        ]).toWait(),
      );
      // wait until splashscreen pass
      await tester.pumpWidget(await createWidgetUnderTest());
      // making sure unutk memastikan render selesai
      await tester.pump(const Duration(seconds: 2));
      /// await tester.pumpAndSettle();
      /// image bermasalah karena http diiverride jadi ga bisa fetch image
      /// jadi image network harus 
      expect(find.byIcon(Icons.favorite), findsAtLeastNWidgets(1));
      // await tester.runAsync(() async {
      // });
    },
  );

  testWidgets(
    "test check if many example text found",
    (WidgetTester tester) async {
      await tester.pumpWidget(await createWidgetUnderTest());
      expect(find.text('example'), findsWidgets);
    },
  );
}
