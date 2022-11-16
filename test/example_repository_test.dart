import 'dart:math';

import 'package:flutter_starter_private/model/GeneralRequest.dart';
import 'package:flutter_starter_private/model/GeneralResponse.dart';
import 'package:flutter_starter_private/model/movie_list_response.dart';
import 'package:flutter_starter_private/repository/example_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockExampleRepository extends Mock implements ExampleRepository {}

void main() {
  late MockExampleRepository mockRepo;
  setUp(() {
    mockRepo = MockExampleRepository();
  });

  group(
    "check all example",
    () {
      final responseGeneral = GeneralResponse(code: 0, info: 'sukses', guid: 0);
      final requestGeneral = GeneralRequest();

      setUp(
        () {},
      );
      test(
        "check number",
        () async {
          when(() => mockRepo.fetchRandom()).thenAnswer((_) async => Random().nextInt(10));
          final randomNumber = await mockRepo.fetchRandom();
          verify(() => mockRepo.fetchRandom()).called(1);
          expect(randomNumber, lessThanOrEqualTo(10));
        },
      );

      test(
        "check movie",
        () async {
          when(() => mockRepo.fetchMovie()).thenAnswer((_) async => ListMovieResponse.fromRawJson(jsonMovie));
          final movieList = await mockRepo.fetchMovie();
          verify(() => mockRepo.fetchMovie()).called(1);
          expect(movieList.page, 1);
          expect(movieList.totalResults, greaterThan(1));
        },
      );

      test(
        "check example",
        () async {
          when(() => mockRepo.fetchExample(requestGeneral)).thenAnswer((_) async => GeneralResponse.fromJson({
                'code': 0,
                'info': 'sukses',
                'guid': 0,
              }));
          final example = await mockRepo.fetchExample(requestGeneral);
          verify(() => mockRepo.fetchExample(requestGeneral)).called(1);
          expect(example.code, 0);
          expect(example, const TypeMatcher<GeneralResponse>());
        },
      );
    },
  );
}

const jsonMovie = '''
{
    "page": 1,
    "results": [
        {
            "adult": false,
            "backdrop_path": "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
            "genre_ids": [
                28,
                14,
                878
            ],
            "id": 436270,
            "original_language": "en",
            "original_title": "Black Adam",
            "overview": "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
            "popularity": 4328.431,
            "poster_path": "/3zXceNTtyj5FLjwQXuPvLYK5YYL.jpg",
            "release_date": "2022-10-19",
            "title": "Black Adam",
            "video": false,
            "vote_average": 6.9,
            "vote_count": 1058
        },
        {
            "adult": false,
            "backdrop_path": "/y5Z0WesTjvn59jP6yo459eUsbli.jpg",
            "genre_ids": [
                27,
                53
            ],
            "id": 663712,
            "original_language": "en",
            "original_title": "Terrifier 2",
            "overview": "After being resurrected by a sinister entity, Art the Clown returns to Miles County where he must hunt down and destroy a teenage girl and her younger brother on Halloween night.  As the body count rises, the siblings fight to stay alive while uncovering the true nature of Art's evil intent.",
            "popularity": 4528.571,
            "poster_path": "/b6IRp6Pl2Fsq37r9jFhGoLtaqHm.jpg",
            "release_date": "2022-10-06",
            "title": "Terrifier 2",
            "video": false,
            "vote_average": 7,
            "vote_count": 579
        }
    ],
    "total_pages": 35876,
    "total_results": 717511
}
''';
