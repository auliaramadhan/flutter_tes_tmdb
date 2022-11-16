import 'package:flutter_starter_private/model/movie_detail_model.dart';
import 'package:flutter_starter_private/model/movie_list_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
  "check json transform",
  () {
    final dataFromJson = MovieDetailResponse.fromJson(mockDetailMovie);
    final revertData = dataFromJson.toJson();
    for (var keyName in revertData.keys) {
      if ( ['genres', 'credits','images'].contains(keyName)) {
        continue;
      }
      expect(revertData[keyName], mockDetailMovie[keyName]);
    }
  },
);
}

const mockDetailMovie = {
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
    "popularity": 3164.736,
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
    "revenue": 351000000,
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
    "vote_average": 6.857,
    "vote_count": 1093,
    "credits": {
        "cast": [
            {
                "adult": false,
                "gender": 2,
                "id": 2426321,
                "known_for_department": "Acting",
                "name": "Bodhi Sabongui",
                "original_name": "Bodhi Sabongui",
                "popularity": 2.756,
                "profile_path": "/eSsi0SrWwp3TfXeUo7HfXqlROjG.jpg",
                "cast_id": 35,
                "character": "Amon Tomaz",
                "credit_id": "60704edc924ce5003f33de9c",
                "order": 7
            },
            {
                "adult": false,
                "gender": 2,
                "id": 517,
                "known_for_department": "Acting",
                "name": "Pierce Brosnan",
                "original_name": "Pierce Brosnan",
                "popularity": 57.147,
                "profile_path": "/dzXVwwJLPwiZeXOnf7YxorqVEEM.jpg",
                "cast_id": 33,
                "character": "Dr. Fate / Kent Nelson",
                "credit_id": "605bb655cedac4006bc75348",
                "order": 8
            },
            {
                "adult": false,
                "gender": 2,
                "id": 2430192,
                "known_for_department": "Acting",
                "name": "James Cusati-Moyer",
                "original_name": "James Cusati-Moyer",
                "popularity": 3.053,
                "profile_path": "/hzdNg0B4iyslssXP0FuYXIS3P7I.jpg",
                "cast_id": 34,
                "character": "Samir",
                "credit_id": "606e29a46b5fc200575e5186",
                "order": 9
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1925441,
                "known_for_department": "Acting",
                "name": "Jalon Christian",
                "original_name": "Jalon Christian",
                "popularity": 2.331,
                "profile_path": "/4LERZ6t9aQdze9Kw8yoGSTZsLES.jpg",
                "cast_id": 171,
                "character": "Hurut",
                "credit_id": "635db3301dbc880079b5fb24",
                "order": 10
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1230371,
                "known_for_department": "Acting",
                "name": "Benjamin Patterson",
                "original_name": "Benjamin Patterson",
                "popularity": 2.28,
                "profile_path": "/iQ5m0rglateZV1Qb3NDEdLYKyC9.jpg",
                "cast_id": 74,
                "character": "Skinny Teth Adam",
                "credit_id": "634e782ec9044c007a6aeb1f",
                "order": 11
            },
            {
                "adult": false,
                "gender": 1,
                "id": 1639904,
                "known_for_department": "Acting",
                "name": "Odelya Halevi",
                "original_name": "Odelya Halevi",
                "popularity": 2.958,
                "profile_path": "/26jv3dcS5Us8Ut13Tu9PmvT7uPh.jpg",
                "cast_id": 75,
                "character": "Shiruta",
                "credit_id": "634e7853c9044c007d2f41af",
                "order": 12
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1384511,
                "known_for_department": "Acting",
                "name": "Uli Latukefu",
                "original_name": "Uli Latukefu",
                "popularity": 6.573,
                "profile_path": "/zyxYWpO64oRVViVutloKsvr8o7s.jpg",
                "cast_id": 37,
                "character": "The Champion",
                "credit_id": "608b149343250f00296fe2b8",
                "order": 13
            },
            {
                "adult": false,
                "gender": 1,
                "id": 87165,
                "known_for_department": "Acting",
                "name": "Jennifer Holland",
                "original_name": "Jennifer Holland",
                "popularity": 10.383,
                "profile_path": "/mv8EcqDIBITO5dwoBKREcJoRjKo.jpg",
                "cast_id": 72,
                "character": "Emilia Harcourt",
                "credit_id": "634477fa1b7c59007e6e3570",
                "order": 14
            },
            {
                "adult": false,
                "gender": 2,
                "id": 31903,
                "known_for_department": "Acting",
                "name": "Henry Winkler",
                "original_name": "Henry Winkler",
                "popularity": 14.867,
                "profile_path": "/8OmkbGkeN7yZj3iIJNo485BBGTC.jpg",
                "cast_id": 80,
                "character": "Uncle Al",
                "credit_id": "634f1553be4b360084e3eef6",
                "order": 15
            },
            {
                "adult": false,
                "gender": 2,
                "id": 59350,
                "known_for_department": "Acting",
                "name": "Chaim Jeraffi",
                "original_name": "Chaim Jeraffi",
                "popularity": 4.601,
                "profile_path": "/odxOLYdm8mOihxpkWzNI1FMdU1I.jpg",
                "cast_id": 50,
                "character": "Djau",
                "credit_id": "61c3f71eaaec71004022a90e",
                "order": 16
            },
            {
                "adult": false,
                "gender": 1,
                "id": 1634619,
                "known_for_department": "Acting",
                "name": "Sharon Gee",
                "original_name": "Sharon Gee",
                "popularity": 2.898,
                "profile_path": "/4caWT1DZfGXNAh2d5UXtnSn9IEp.jpg",
                "cast_id": 77,
                "character": "Mrs. Farmer",
                "credit_id": "634e78dbe263bb007c299d19",
                "order": 17
            },
            {
                "adult": false,
                "gender": 2,
                "id": 6909,
                "known_for_department": "Acting",
                "name": "Stephan Jones",
                "original_name": "Stephan Jones",
                "popularity": 2.925,
                "profile_path": "/zui1oPy46gJEm91qL5YpCQxipnU.jpg",
                "cast_id": 41,
                "character": "Commander",
                "credit_id": "60e0da44071650002d660414",
                "order": 18
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3763400,
                "known_for_department": "Acting",
                "name": "A. Manuel Miranda",
                "original_name": "A. Manuel Miranda",
                "popularity": 0.6,
                "profile_path": null,
                "cast_id": 172,
                "character": "Ancient Mine Soldier",
                "credit_id": "635db567e18e3f009092bac8",
                "order": 19
            },
            {
                "adult": false,
                "gender": 2,
                "id": 938,
                "known_for_department": "Acting",
                "name": "Djimon Hounsou",
                "original_name": "Djimon Hounsou",
                "popularity": 27.184,
                "profile_path": "/hco0KMbrxACYTmBfAkSzCf23CXV.jpg",
                "cast_id": 81,
                "character": "Wizard",
                "credit_id": "63509b80596a91007a14e67c",
                "order": 20
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1431483,
                "known_for_department": "Acting",
                "name": "Raj Kala",
                "original_name": "Raj Kala",
                "popularity": 1.237,
                "profile_path": null,
                "cast_id": 173,
                "character": "Wizard #1",
                "credit_id": "635db5abb3316b007cad0756",
                "order": 21
            },
            {
                "adult": false,
                "gender": 2,
                "id": 2295515,
                "known_for_department": "Acting",
                "name": "E. Lloyd Napier",
                "original_name": "E. Lloyd Napier",
                "popularity": 0.6,
                "profile_path": null,
                "cast_id": 174,
                "character": "Wizard #2",
                "credit_id": "635db5d31684f7007ec0038e",
                "order": 22
            },
            {
                "adult": false,
                "gender": 1,
                "id": 3763403,
                "known_for_department": "Acting",
                "name": "Kiara Rashawn",
                "original_name": "Kiara Rashawn",
                "popularity": 0.6,
                "profile_path": null,
                "cast_id": 175,
                "character": "Wizard #3",
                "credit_id": "635db5f31dbc880090f43ff4",
                "order": 23
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3016275,
                "known_for_department": "Acting",
                "name": "Onye Eme-Akwari",
                "original_name": "Onye Eme-Akwari",
                "popularity": 0.98,
                "profile_path": null,
                "cast_id": 176,
                "character": "Wizard #4",
                "credit_id": "635db64c1b7294008312f0f0",
                "order": 24
            },
            {
                "adult": false,
                "gender": 1,
                "id": 2465248,
                "known_for_department": "Acting",
                "name": "Sanna Erica",
                "original_name": "Sanna Erica",
                "popularity": 0.84,
                "profile_path": null,
                "cast_id": 177,
                "character": "Wizard #5",
                "credit_id": "635db692ba48020079640e2e",
                "order": 25
            },
            {
                "adult": false,
                "gender": 2,
                "id": 196934,
                "known_for_department": "Acting",
                "name": "Vince Canlas",
                "original_name": "Vince Canlas",
                "popularity": 2.652,
                "profile_path": "/4H6eHIiJNSABsTzKqtr96sHu2MB.jpg",
                "cast_id": 178,
                "character": "Wizard #6",
                "credit_id": "635db6d9e2102300792b2771",
                "order": 26
            },
            {
                "adult": false,
                "gender": 1,
                "id": 18347,
                "known_for_department": "Acting",
                "name": "Tonea Stewart",
                "original_name": "Tonea Stewart",
                "popularity": 2.168,
                "profile_path": "/wWmYTgwq6Llqhy4IoLC6FCUFQlq.jpg",
                "cast_id": 179,
                "character": "Wizard #7",
                "credit_id": "635db70841eee1007a0d1bf2",
                "order": 27
            },
            {
                "adult": false,
                "gender": 1,
                "id": 3763404,
                "known_for_department": "Acting",
                "name": "Meghna Nagarajan",
                "original_name": "Meghna Nagarajan",
                "popularity": 0.6,
                "profile_path": null,
                "cast_id": 180,
                "character": "Apartment Resident",
                "credit_id": "635db73d9ba86a007d77fe62",
                "order": 28
            },
            {
                "adult": false,
                "gender": 2,
                "id": 102742,
                "known_for_department": "Acting",
                "name": "Patrick Sabongui",
                "original_name": "Patrick Sabongui",
                "popularity": 6.962,
                "profile_path": "/yI8xBqEi5IAeyoEgGcdbcyEc9vO.jpg",
                "cast_id": 181,
                "character": "Rami",
                "credit_id": "635db764e263bb0090f49bd2",
                "order": 29
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3433788,
                "known_for_department": "Acting",
                "name": "Alex Parkinson",
                "original_name": "Alex Parkinson",
                "popularity": 0.694,
                "profile_path": null,
                "cast_id": 182,
                "character": "Chauffeur",
                "credit_id": "635db7b50c3ec80090b484f5",
                "order": 30
            },
            {
                "adult": false,
                "gender": 2,
                "id": 58508,
                "known_for_department": "Acting",
                "name": "Joseph Gatt",
                "original_name": "Joseph Gatt",
                "popularity": 10.367,
                "profile_path": "/ufXNVj0gOpGOB6uUnNuTIzk5rpb.jpg",
                "cast_id": 49,
                "character": "Intergang Squad Leader",
                "credit_id": "61c3f6814a52f80062b05ca9",
                "order": 31
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1923367,
                "known_for_department": "Acting",
                "name": "Kamen Casey",
                "original_name": "Kamen Casey",
                "popularity": 0.703,
                "profile_path": null,
                "cast_id": 186,
                "character": "Intergang Pilot #2",
                "credit_id": "635f0fe6b87aec007909617b",
                "order": 32
            },
            {
                "adult": false,
                "gender": 2,
                "id": 3764469,
                "known_for_department": "Acting",
                "name": "Dennis Dawson",
                "original_name": "Dennis Dawson",
                "popularity": 0.6,
                "profile_path": null,
                "cast_id": 187,
                "character": "Intergang Pilot #3",
                "credit_id": "635f0ff7b87aec007c2b0df9",
                "order": 33
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1559690,
                "known_for_department": "Acting",
                "name": "Mike Senior",
                "original_name": "Mike Senior",
                "popularity": 1.174,
                "profile_path": "/hruBzjxRvB2OMiP4OTsoaisay3J.jpg",
                "cast_id": 188,
                "character": "Intergang Pilot #4",
                "credit_id": "635f101941eee100911798b5",
                "order": 34
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1838518,
                "known_for_department": "Acting",
                "name": "Jermaine Rivers",
                "original_name": "Jermaine Rivers",
                "popularity": 1.62,
                "profile_path": "/4p3XXHBRNhGHJLc3aholtumj7wq.jpg",
                "cast_id": 189,
                "character": "Intergang Sniper",
                "credit_id": "635f102b1b7294007bf03ab3",
                "order": 35
            },
            {
                "adult": false,
                "gender": 1,
                "id": 1613974,
                "known_for_department": "Acting",
                "name": "Regina Ting Chen",
                "original_name": "Regina Ting Chen",
                "popularity": 4.94,
                "profile_path": "/7Lqwq6UYbZd7XyMujUKUVUHGSIb.jpg",
                "cast_id": 190,
                "character": "Helicopter #1 Pilot #1",
                "credit_id": "635f10473396b9007acfa840",
                "order": 36
            },
            {
                "adult": false,
                "gender": 2,
                "id": 172046,
                "known_for_department": "Acting",
                "name": "Sekou Laidlow",
                "original_name": "Sekou Laidlow",
                "popularity": 0.98,
                "profile_path": "/6BQNIrx7CKUn5MV4gqYOe8fNK7H.jpg",
                "cast_id": 191,
                "character": "Helicopter #2 Pilot #1",
                "credit_id": "635f105766565a007f8a14e6",
                "order": 37
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1310853,
                "known_for_department": "Acting",
                "name": "Cameron Moir",
                "original_name": "Cameron Moir",
                "popularity": 1.932,
                "profile_path": null,
                "cast_id": 192,
                "character": "Helicopter #2 Pilot #2",
                "credit_id": "635f107340d0fe0082671907",
                "order": 38
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1769802,
                "known_for_department": "Acting",
                "name": "Donny Carrington",
                "original_name": "Donny Carrington",
                "popularity": 2.757,
                "profile_path": "/bjU5fNiV4dWsHJ6drQpFYgLjbnD.jpg",
                "cast_id": 40,
                "character": "Checkpoint Mercenary #1",
                "credit_id": "60e0da17a3b5e60029108db6",
                "order": 39
            },
            {
                "adult": false,
                "gender": 2,
                "id": 2024835,
                "known_for_department": "Acting",
                "name": "Boone Platt",
                "original_name": "Boone Platt",
                "popularity": 4.766,
                "profile_path": "/dnG5oqrU1obnzCxkWsSVzZRcivy.jpg",
                "cast_id": 193,
                "character": "Checkpoint Mercenary #2",
                "credit_id": "635f109840d0fe008267193c",
                "order": 40
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1310179,
                "known_for_department": "Acting",
                "name": "Philip Fornah",
                "original_name": "Philip Fornah",
                "popularity": 3.987,
                "profile_path": "/mH6UjRLpoHkwwDzCMkzXfyFAlje.jpg",
                "cast_id": 194,
                "character": "Squad Mercenary #1",
                "credit_id": "635f10afb87aec00790962d9",
                "order": 41
            },
            {
                "adult": false,
                "gender": 2,
                "id": 1628383,
                "known_for_department": "Acting",
                "name": "Derek Russo",
                "original_name": "Derek Russo",
                "popularity": 3.025,
                "profile_path": "/5x5b61WVyydJV9qHPVIBzefCsMf.jpg",
                "cast_id": 195,
                "character": "Squad Mercenary #2",
                "credit_id": "635f10ba87e63e007d477bc8",
                "order": 42
            },
        ],
        "crew": [
            {
                "adult": false,
                "gender": 2,
                "id": 3687,
                "known_for_department": "Sound",
                "name": "Harry Cohen",
                "original_name": "Harry Cohen",
                "popularity": 1.532,
                "profile_path": "/pXDkgsdiMfmChkHpSvVIqYYAdFj.jpg",
                "credit_id": "6356156b5f4b73007b8642ed",
                "department": "Sound",
                "job": "Sound Designer"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 2445,
                "known_for_department": "Production",
                "name": "Eric McLeod",
                "original_name": "Eric McLeod",
                "popularity": 5.601,
                "profile_path": null,
                "credit_id": "61c3771121c4ca001d0b0d4f",
                "department": "Production",
                "job": "Executive Producer"
            },
            {
                "adult": false,
                "gender": 0,
                "id": 7235,
                "known_for_department": "Art",
                "name": "Beat Frutiger",
                "original_name": "Beat Frutiger",
                "popularity": 1.4,
                "profile_path": "/2VMPjH8Olb5qHqsKNelSxkViH9b.jpg",
                "credit_id": "63562252f9aa470079445003",
                "department": "Art",
                "job": "Supervising Art Director"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 5387,
                "known_for_department": "Camera",
                "name": "Lawrence Sher",
                "original_name": "Lawrence Sher",
                "popularity": 2.338,
                "profile_path": "/hjnMqT5EbDTOvvsXZxiP74qeGbp.jpg",
                "credit_id": "5dd040572866fa0015876806",
                "department": "Camera",
                "job": "Director of Photography"
            },
            {
                "adult": false,
                "gender": 1,
                "id": 20586,
                "known_for_department": "Art",
                "name": "Stella Vaccaro",
                "original_name": "Stella Vaccaro",
                "popularity": 3.073,
                "profile_path": null,
                "credit_id": "6356240ea06efe007f28d946",
                "department": "Art",
                "job": "Set Designer"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 9543,
                "known_for_department": "Production",
                "name": "Beau Flynn",
                "original_name": "Beau Flynn",
                "popularity": 7.728,
                "profile_path": "/AnYq9pFckXXUl5uCYhM7huDeolP.jpg",
                "credit_id": "5dce120979a1c30013489e77",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 14350,
                "known_for_department": "Art",
                "name": "Richard F. Mays",
                "original_name": "Richard F. Mays",
                "popularity": 1.96,
                "profile_path": null,
                "credit_id": "635623a7f8e98200817c0f70",
                "department": "Art",
                "job": "Set Designer"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 18918,
                "known_for_department": "Acting",
                "name": "Dwayne Johnson",
                "original_name": "Dwayne Johnson",
                "popularity": 41.286,
                "profile_path": "/cgoy7t5Ve075naBPcewZrc08qGw.jpg",
                "credit_id": "5fd7d3c83344c6003faf1e8a",
                "department": "Production",
                "job": "Producer"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 21984,
                "known_for_department": "Art",
                "name": "Larry Dias",
                "original_name": "Larry Dias",
                "popularity": 1.4,
                "profile_path": null,
                "credit_id": "63562295fa78cd007d0ab40c",
                "department": "Art",
                "job": "Set Decoration"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 10830,
                "known_for_department": "Production",
                "name": "Toby Emmerich",
                "original_name": "Toby Emmerich",
                "popularity": 7.897,
                "profile_path": "/mfkHPnmazcxDcjyVovNPzhUX1JN.jpg",
                "credit_id": "631ad3190e5aba007c10c50f",
                "department": "Production",
                "job": "Executive Producer"
            },
            {
                "adult": false,
                "gender": 1,
                "id": 23787,
                "known_for_department": "Costume & Make-Up",
                "name": "Deborah La Mia Denaver",
                "original_name": "Deborah La Mia Denaver",
                "popularity": 6.362,
                "profile_path": null,
                "credit_id": "6356132cf9aa47007cd9d907",
                "department": "Costume & Make-Up",
                "job": "Makeup Department Head"
            },
            {
                "adult": false,
                "gender": 1,
                "id": 23787,
                "known_for_department": "Costume & Make-Up",
                "name": "Deborah La Mia Denaver",
                "original_name": "Deborah La Mia Denaver",
                "popularity": 6.362,
                "profile_path": null,
                "credit_id": "63561325d8e225007a1b3188",
                "department": "Costume & Make-Up",
                "job": "Makeup Designer"
            },
            {
                "adult": false,
                "gender": 0,
                "id": 42281,
                "known_for_department": "Art",
                "name": "Scott Herbertson",
                "original_name": "Scott Herbertson",
                "popularity": 1.62,
                "profile_path": null,
                "credit_id": "6356235943cd54007f77a370",
                "department": "Art",
                "job": "Set Designer"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 47365,
                "known_for_department": "Production",
                "name": "Walter Hamada",
                "original_name": "Walter Hamada",
                "popularity": 5.148,
                "profile_path": "/cykm5UtrpVYMY6gc5CfFt6eXZXG.jpg",
                "credit_id": "61c376d637b3a9008fbd8708",
                "department": "Production",
                "job": "Executive Producer"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 57430,
                "known_for_department": "Production",
                "name": "Richard Brener",
                "original_name": "Richard Brener",
                "popularity": 2.256,
                "profile_path": "/i1nFbAKpbtjxBr2vkY5WeYRs250.jpg",
                "credit_id": "61c376cf21621d001b2c802b",
                "department": "Production",
                "job": "Executive Producer"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 59521,
                "known_for_department": "Directing",
                "name": "Jaume Collet-Serra",
                "original_name": "Jaume Collet-Serra",
                "popularity": 10.343,
                "profile_path": "/saAeTFfgt9YRAybXmzfmIz01UCB.jpg",
                "credit_id": "5cfabe43c3a36868871ec1c4",
                "department": "Directing",
                "job": "Director"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 66549,
                "known_for_department": "Writing",
                "name": "Adam Sztykiel",
                "original_name": "Adam Sztykiel",
                "popularity": 4.781,
                "profile_path": null,
                "credit_id": "635f0dceb87aec00907d8795",
                "department": "Writing",
                "job": "Writer"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 92303,
                "known_for_department": "Costume & Make-Up",
                "name": "Gary Archer",
                "original_name": "Gary Archer",
                "popularity": 1.96,
                "profile_path": null,
                "credit_id": "62c33a38a313b8004c498b6f",
                "department": "Costume & Make-Up",
                "job": "Prosthetics"
            },
            {
                "adult": false,
                "gender": 1,
                "id": 83062,
                "known_for_department": "Costume & Make-Up",
                "name": "Kelcey Fry",
                "original_name": "Kelcey Fry",
                "popularity": 1.62,
                "profile_path": null,
                "credit_id": "6356134ad18fb900825e3a7d",
                "department": "Costume & Make-Up",
                "job": "Makeup Supervisor"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 111456,
                "known_for_department": "Editing",
                "name": "Michael L. Sale",
                "original_name": "Michael L. Sale",
                "popularity": 2.146,
                "profile_path": null,
                "credit_id": "631ad29572d855007df6f757",
                "department": "Editing",
                "job": "Editor"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 158916,
                "known_for_department": "Sound",
                "name": "Michael Keller",
                "original_name": "Michael Keller",
                "popularity": 1.286,
                "profile_path": null,
                "credit_id": "6356159ed18fb9007ab38ff2",
                "department": "Sound",
                "job": "Sound Re-Recording Mixer"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 211962,
                "known_for_department": "Writing",
                "name": "Geoff Johns",
                "original_name": "Geoff Johns",
                "popularity": 2.995,
                "profile_path": "/1hiQjkIkeFoiwvD4yIk2Dq6tnOa.jpg",
                "credit_id": "61c37719d861af0099118d68",
                "department": "Production",
                "job": "Executive Producer"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 929145,
                "known_for_department": "Sound",
                "name": "Lorne Balfe",
                "original_name": "Lorne Balfe",
                "popularity": 2.985,
                "profile_path": "/lHAhZC9RAUYtjhKDokKYyNNitLz.jpg",
                "credit_id": "631ad2f4c613ce00917bc03e",
                "department": "Sound",
                "job": "Original Music Composer"
            },
            {
                "adult": false,
                "gender": 2,
                "id": 969283,
                "known_for_department": "Production",
                "name": "Dave Neustadter",
                "original_name": "Dave Neustadter",
                "popularity": 8.049,
                "profile_path": null,
                "credit_id": "61c376e3b04228009020986e",
                "department": "Production",
                "job": "Executive Producer"
            },
            {
                "adult": false,
                "gender": 1,
                "id": 1039217,
                "known_for_department": "Production",
                "name": "Dany Garcia",
                "original_name": "Dany Garcia",
                "popularity": 8.482,
                "profile_path": "/nZnQuskqDYmm9BDfsgRjDyVakCR.jpg",
                "credit_id": "5fd7d3c03a340b003e5bf0b0",
                "department": "Production",
                "job": "Producer"
            },
        ]
    },
    "images": {
        "posters": [
            {
                "aspect_ratio": 0.666,
                "height": 1921,
                "iso_639_1": "en",
                "file_path": "/3zXceNTtyj5FLjwQXuPvLYK5YYL.jpg",
                "vote_average": 5.832,
                "vote_count": 22,
                "width": 1280
            },
            {
                "aspect_ratio": 0.667,
                "height": 2047,
                "iso_639_1": "en",
                "file_path": "/vaGYks5lnsWv9cD8mbQ3W5fAzPr.jpg",
                "vote_average": 5.738,
                "vote_count": 18,
                "width": 1365
            },
            {
                "aspect_ratio": 0.667,
                "height": 2100,
                "iso_639_1": "en",
                "file_path": "/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
                "vote_average": 5.606,
                "vote_count": 30,
                "width": 1400
            },
            {
                "aspect_ratio": 0.667,
                "height": 3000,
                "iso_639_1": "pt",
                "file_path": "/9z256FFPDsL7kSVJ9oyLELaN1ph.jpg",
                "vote_average": 5.522,
                "vote_count": 4,
                "width": 2000
            },
            {
                "aspect_ratio": 0.667,
                "height": 3000,
                "iso_639_1": "en",
                "file_path": "/9ADi4MvgLV80XefKulLFFSXxt2b.jpg",
                "vote_average": 5.454,
                "vote_count": 3,
                "width": 2000
            },
            {
                "aspect_ratio": 0.667,
                "height": 3000,
                "iso_639_1": "en",
                "file_path": "/8BaTICRBP2duxS3qopKJtiaohHN.jpg",
                "vote_average": 5.384,
                "vote_count": 2,
                "width": 2000
            },
            {
                "aspect_ratio": 0.667,
                "height": 3000,
                "iso_639_1": "fr",
                "file_path": "/6dK9T9qx1lp64sKoOkncDyy4Uhg.jpg",
                "vote_average": 5.322,
                "vote_count": 5,
                "width": 2000
            },
            {
                "aspect_ratio": 0.667,
                "height": 2550,
                "iso_639_1": "gu",
                "file_path": "/17OfTgQTlAUx0O18tqJOPz89HuU.jpg",
                "vote_average": 5.322,
                "vote_count": 5,
                "width": 1700
            },
            {
                "aspect_ratio": 0.667,
                "height": 3000,
                "iso_639_1": "es",
                "file_path": "/mPTzXksC8HcAj6EM6WjZFJVJEzF.jpg",
                "vote_average": 5.318,
                "vote_count": 3,
                "width": 2000
            },
            {
                "aspect_ratio": 0.667,
                "height": 3000,
                "iso_639_1": "es",
                "file_path": "/moDLTCdLx38kMhN53KOTw0LdWMh.jpg",
                "vote_average": 5.318,
                "vote_count": 3,
                "width": 2000
            },
            {
                "aspect_ratio": 0.667,
                "height": 2100,
                "iso_639_1": null,
                "file_path": "/cMfSvsmq4bgFCcpfvpJsLy2Cjts.jpg",
                "vote_average": 5.312,
                "vote_count": 1,
                "width": 1400
            },
           
        ]
    }
};