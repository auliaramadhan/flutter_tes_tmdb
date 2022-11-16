import 'package:flutter_starter_private/model/movie_detail_model.dart';
import 'package:flutter_starter_private/model/movie_list_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
  "check json transform",
  () {
    final dataFromJson = MovieDetailResponse.fromJson(_mapData);
    final revertData = dataFromJson.toJson();
    for (var keyName in revertData.keys) {
      if (keyName == 'genres') {
        continue;
      }
      expect(revertData[keyName], _mapData[keyName]);
    }

  },
);
}

const _mapData = {
    "adult": false,
    "backdrop_path": "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
    "belongs_to_collection": null,
    "budget": 200000000,
    "genres": [
        {
            "id": 28,
            "name": "Action"
        },
        {
            "id": 14,
            "name": "Fantasy"
        },
        {
            "id": 878,
            "name": "Science Fiction"
        }
    ],
    "homepage": "https://www.dc.com/BlackAdam",
    "id": 436270,
    "imdb_id": "tt6443346",
    "original_language": "en",
    "original_title": "Black Adam",
    "overview": "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
    "popularity": 4328.431,
    "poster_path": "/3zXceNTtyj5FLjwQXuPvLYK5YYL.jpg",
    "production_companies": [
        {
            "id": 12,
            "logo_path": "/iaYpEp3LQmb8AfAtmTvpqd4149c.png",
            "name": "New Line Cinema",
            "origin_country": "US"
        },
        {
            "id": 34081,
            "logo_path": null,
            "name": "Flynn Picture Company",
            "origin_country": "US"
        },
        {
            "id": 73669,
            "logo_path": "/7tmSGstK3KwgcDIuBYLTAayjit9.png",
            "name": "Seven Bucks Productions",
            "origin_country": "US"
        },
        {
            "id": 128064,
            "logo_path": "/13F3Jf7EFAcREU0xzZqJnVnyGXu.png",
            "name": "DC Films",
            "origin_country": "US"
        }
    ],
    "production_countries": [
        {
            "iso_3166_1": "US",
            "name": "United States of America"
        }
    ],
    "release_date": "2022-10-19",
    "revenue": 319000000,
    "runtime": 125,
    "spoken_languages": [
        {
            "english_name": "English",
            "iso_639_1": "en",
            "name": "English"
        }
    ],
    "status": "Released",
    "tagline": "The world needed a hero. It got Black Adam.",
    "title": "Black Adam",
    "video": false,
    "vote_average": 6.855,
    "vote_count": 1063
};