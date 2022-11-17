import 'package:flutter_starter_private/model/movie_detail_model.dart';
import 'package:flutter_starter_private/model/movie_list_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    "check json transform",
    () {
      final dataFromJson = ListMovieResponse.fromJson(mockListMovie);
      final revertData = dataFromJson.toJson();
      for (var keyName in revertData.keys) {
        if (keyName == 'results') {
          expect(revertData[keyName]!.length, mockListMovie[keyName]!.length);
          continue;
        }
        expect(revertData[keyName], mockListMovie[keyName]);
      }
    },
  );
}

const Map<String, dynamic> mockListMovie = {
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
      "genre_ids": [28, 14, 878],
      "id": 436270,
      "original_language": "en",
      "original_title": "Black Adam",
      "overview":
          "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
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
      "genre_ids": [27, 53],
      "id": 663712,
      "original_language": "en",
      "original_title": "Terrifier 2",
      "overview":
          "After being resurrected by a sinister entity, Art the Clown returns to Miles County where he must hunt down and destroy a teenage girl and her younger brother on Halloween night.  As the body count rises, the siblings fight to stay alive while uncovering the true nature of Art's evil intent.",
      "popularity": 4528.571,
      "poster_path": "/b6IRp6Pl2Fsq37r9jFhGoLtaqHm.jpg",
      "release_date": "2022-10-06",
      "title": "Terrifier 2",
      "video": false,
      "vote_average": 7,
      "vote_count": 579
    },
    {
      "adult": false,
      "backdrop_path": "/8sMmAmN2x7mBiNKEX2o0aOTozEB.jpg",
      "genre_ids": [28, 12, 878],
      "id": 505642,
      "original_language": "en",
      "original_title": "Black Panther: Wakanda Forever",
      "overview":
          "Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death. As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.",
      "popularity": 4594.775,
      "poster_path": "/sv1xJUazXeYqALzczSZ3O6nkH75.jpg",
      "release_date": "2022-11-09",
      "title": "Black Panther: Wakanda Forever",
      "video": false,
      "vote_average": 7.6,
      "vote_count": 465
    },
    {
      "adult": false,
      "backdrop_path": "/b2FxWOxe9K7ZZ1uaPOze2RJ1ajq.jpg",
      "genre_ids": [27, 28, 35],
      "id": 675054,
      "original_language": "es",
      "original_title": "MexZombies",
      "overview": "A group of teenagers must face a zombie apocalypse, and help reestablish order.",
      "popularity": 3604.019,
      "poster_path": "/85zufUxhD97k2s5Bu2u101Qd8Sg.jpg",
      "release_date": "2022-10-26",
      "title": "MexZombies",
      "video": false,
      "vote_average": 7.3,
      "vote_count": 66
    },
    {
      "adult": false,
      "backdrop_path": "/u9Io1hVnxb2b3T0z99aOK8sq0SN.jpg",
      "genre_ids": [9648, 12, 80],
      "id": 829280,
      "original_language": "en",
      "original_title": "Enola Holmes 2",
      "overview":
          "Now a detective-for-hire like her infamous brother, Enola Holmes takes on her first official case to find a missing girl, as the sparks of a dangerous conspiracy ignite a mystery that requires the help of friends — and Sherlock himself — to unravel.",
      "popularity": 4081.058,
      "poster_path": "/tegBpjM5ODoYoM1NjaiHVLEA0QM.jpg",
      "release_date": "2022-11-04",
      "title": "Enola Holmes 2",
      "video": false,
      "vote_average": 7.7,
      "vote_count": 761
    },
    {
      "adult": false,
      "backdrop_path": "/mqsPyyeDCBAghXyjbw4TfEYwljw.jpg",
      "genre_ids": [10752, 18, 28],
      "id": 49046,
      "original_language": "de",
      "original_title": "Im Westen nichts Neues",
      "overview":
          "Paul Baumer and his friends Albert and Muller, egged on by romantic dreams of heroism, voluntarily enlist in the German army. Full of excitement and patriotic fervour, the boys enthusiastically march into a war they believe in. But once on the Western Front, they discover the soul-destroying horror of World War I.",
      "popularity": 3142.726,
      "poster_path": "/hYqOjJ7Gh1fbqXrxlIao1g8ZehF.jpg",
      "release_date": "2022-10-07",
      "title": "All Quiet on the Western Front",
      "video": false,
      "vote_average": 7.8,
      "vote_count": 726
    },
    {
      "adult": false,
      "backdrop_path": "/pGx6O6IwqADOsgmqWzPysmWnOyr.jpg",
      "genre_ids": [28, 14],
      "id": 732459,
      "original_language": "en",
      "original_title": "Blade of the 47 Ronin",
      "overview": "In this sequel to \"47 Ronin,\" a new class of warriors emerges among the Samurai clans to keep a sought-after sword from falling into the wrong hands.",
      "popularity": 2516.902,
      "poster_path": "/kjFDIlUCJkcpFxYKtE6OsGcAfQQ.jpg",
      "release_date": "2022-10-25",
      "title": "Blade of the 47 Ronin",
      "video": false,
      "vote_average": 6.8,
      "vote_count": 66
    },
    {
      "adult": false,
      "backdrop_path": "/1DBDwevWS8OhiT3wqqlW7KGPd6m.jpg",
      "genre_ids": [53],
      "id": 985939,
      "original_language": "en",
      "original_title": "Fall",
      "overview":
          "For best friends Becky and Hunter, life is all about conquering fears and pushing limits. But after they climb 2,000 feet to the top of a remote, abandoned radio tower, they find themselves stranded with no way down. Now Becky and Hunter’s expert climbing skills will be put to the ultimate test as they desperately fight to survive the elements, a lack of supplies, and vertigo-inducing heights",
      "popularity": 2180.037,
      "poster_path": "/spCAxD99U1A6jsiePFoqdEcY0dG.jpg",
      "release_date": "2022-08-11",
      "title": "Fall",
      "video": false,
      "vote_average": 7.3,
      "vote_count": 1715
    },
    {
      "adult": false,
      "backdrop_path": "/tIX6j3NzadlwGcJ52nuWdmtOQkg.jpg",
      "genre_ids": [27, 53, 9648],
      "id": 717728,
      "original_language": "en",
      "original_title": "Jeepers Creepers: Reborn",
      "overview":
          "Forced to travel with her boyfriend to a horror festival, Laine begins to experience disturbing visions associated with the urban legend of The Creeper. As the festival arrives and the blood-soaked entertainment builds to a frenzy, she becomes the center of it while something unearthly has been summoned.",
      "popularity": 1909.338,
      "poster_path": "/aGBuiirBIQ7o64FmJxO53eYDuro.jpg",
      "release_date": "2022-09-15",
      "title": "Jeepers Creepers: Reborn",
      "video": false,
      "vote_average": 5.8,
      "vote_count": 452
    },
    {
      "adult": false,
      "backdrop_path": "/cvOHMfZTxIiNI9yyjYgYfCpT48p.jpg",
      "genre_ids": [28, 80, 53],
      "id": 944864,
      "original_language": "nl",
      "original_title": "The Takeover",
      "overview":
          "Self-proclaimed ethical hacker Mel Bandison's life is turned upside down when she stops a data breach on a high-tech self-driving bus that also happens to shut down an international criminal network. She then becomes a target and is framed with a deepfake video that “shows” that she murders someone.",
      "popularity": 1666.927,
      "poster_path": "/g7rdcofib7HqdlDP1LT7Hmf1f2o.jpg",
      "release_date": "2022-11-01",
      "title": "The Takeover",
      "video": false,
      "vote_average": 5.7,
      "vote_count": 62
    },
    {
      "adult": false,
      "backdrop_path": "/5GA3vV1aWWHTSDO5eno8V5zDo8r.jpg",
      "genre_ids": [27, 53],
      "id": 760161,
      "original_language": "en",
      "original_title": "Orphan: First Kill",
      "overview":
          "After escaping from an Estonian psychiatric facility, Leena Klammer travels to America by impersonating Esther, the missing daughter of a wealthy family. But when her mask starts to slip, she is put against a mother who will protect her family from the murderous “child” at any cost.",
      "popularity": 1924.954,
      "poster_path": "/pHkKbIRoCe7zIFvqan9LFSaQAde.jpg",
      "release_date": "2022-07-27",
      "title": "Orphan: First Kill",
      "video": false,
      "vote_average": 6.8,
      "vote_count": 1281
    },
    {
      "adult": false,
      "backdrop_path": "/yo0qfH2dQGGMxkfivdkz5zxVatD.jpg",
      "genre_ids": [27, 53],
      "id": 830788,
      "original_language": "en",
      "original_title": "The Invitation",
      "overview":
          "After the death of her mother, Evie is approached by an unknown cousin who invites her to a lavish wedding in the English countryside. Soon, she realizes a gothic conspiracy is afoot and must fight for survival as she uncovers twisted secrets in her family’s history.",
      "popularity": 1623.516,
      "poster_path": "/jcTq6gIskCsHlKDvCKKouEfiU66.jpg",
      "release_date": "2022-08-24",
      "title": "The Invitation",
      "video": false,
      "vote_average": 6.4,
      "vote_count": 311
    },
    {
      "adult": false,
      "backdrop_path": "/zt6sKnx9dEiRCb7oVMlfmmMGJMO.jpg",
      "genre_ids": [28, 35, 53],
      "id": 718930,
      "original_language": "en",
      "original_title": "Bullet Train",
      "overview":
          "Unlucky assassin Ladybug is determined to do his job peacefully after one too many gigs gone off the rails. Fate, however, may have other plans, as Ladybug's latest mission puts him on a collision course with lethal adversaries from around the globe—all with connected, yet conflicting, objectives—on the world's fastest train.",
      "popularity": 1339.013,
      "poster_path": "/tVxDe01Zy3kZqaZRNiXFGDICdZk.jpg",
      "release_date": "2022-07-03",
      "title": "Bullet Train",
      "video": false,
      "vote_average": 7.5,
      "vote_count": 2292
    },
    {
      "adult": false,
      "backdrop_path": "/akYTfFvYkFGJReFxXM841NidlAa.jpg",
      "genre_ids": [80, 18],
      "id": 1033107,
      "original_language": "en",
      "original_title": "Wild Is the Wind",
      "overview": "When two corrupt police officers investigate the brutal murder of a young girl, tensions come to a head in their small, racially-segregated town.",
      "popularity": 1695.867,
      "poster_path": "/rITxQBtnMpneZf8QzH1dqONQocx.jpg",
      "release_date": "2022-10-28",
      "title": "Wild Is the Wind",
      "video": false,
      "vote_average": 5.8,
      "vote_count": 29
    },
    {
      "adult": false,
      "backdrop_path": "/iS9U3VHpPEjTWnwmW56CrBlpgLj.jpg",
      "genre_ids": [14, 35, 10751],
      "id": 642885,
      "original_language": "en",
      "original_title": "Hocus Pocus 2",
      "overview":
          "29 years since the Black Flame Candle was last lit, the 17th-century Sanderson sisters are resurrected, and they are looking for revenge. Now it's up to three high school students to stop the ravenous witches from wreaking a new kind of havoc on Salem before dawn on All Hallow's Eve.",
      "popularity": 1533.422,
      "poster_path": "/7ze7YNmUaX81ufctGqt0AgHxRtL.jpg",
      "release_date": "2022-09-27",
      "title": "Hocus Pocus 2",
      "video": false,
      "vote_average": 7.6,
      "vote_count": 1086
    },
    {
      "adult": false,
      "backdrop_path": "/naNXYdBzTEb1KwOdi1RbBkM9Zv1.jpg",
      "genre_ids": [27, 53],
      "id": 420634,
      "original_language": "en",
      "original_title": "Terrifier",
      "overview": "On Halloween night, a young woman finds herself as the obsession of a sadistic murderer known as Art the Clown.",
      "popularity": 1545.705,
      "poster_path": "/nfRlQCl590F30L37aihuqBGBvaO.jpg",
      "release_date": "2016-03-15",
      "title": "Terrifier",
      "video": false,
      "vote_average": 6.6,
      "vote_count": 956
    },
    {
      "adult": false,
      "backdrop_path": "/olPXihyFeeNvnaD6IOBltgIV1FU.jpg",
      "genre_ids": [27, 9648, 53],
      "id": 882598,
      "original_language": "en",
      "original_title": "Smile",
      "overview":
          "After witnessing a bizarre, traumatic incident involving a patient, Dr. Rose Cotter starts experiencing frightening occurrences that she can't explain. As an overwhelming terror begins taking over her life, Rose must confront her troubling past in order to survive and escape her horrifying new reality.",
      "popularity": 1246.237,
      "poster_path": "/aPqcQwu4VGEewPhagWNncDbJ9Xp.jpg",
      "release_date": "2022-09-23",
      "title": "Smile",
      "video": false,
      "vote_average": 6.7,
      "vote_count": 495
    },
    {
      "adult": false,
      "backdrop_path": "/AaV1YIdWKnjAIAOe8UUKBFm327v.jpg",
      "genre_ids": [28, 18],
      "id": 361743,
      "original_language": "en",
      "original_title": "Top Gun: Maverick",
      "overview":
          "After more than thirty years of service as one of the Navy’s top aviators, and dodging the advancement in rank that would ground him, Pete “Maverick” Mitchell finds himself training a detachment of TOP GUN graduates for a specialized mission the likes of which no living pilot has ever seen.",
      "popularity": 1491.786,
      "poster_path": "/62HCnUTziyWcpDaBO2i1DX17ljH.jpg",
      "release_date": "2022-05-24",
      "title": "Top Gun: Maverick",
      "video": false,
      "vote_average": 8.3,
      "vote_count": 4725
    },
    {
      "adult": false,
      "backdrop_path": "/jsoz1HlxczSuTx0mDl2h0lxy36l.jpg",
      "genre_ids": [14, 28, 35],
      "id": 616037,
      "original_language": "en",
      "original_title": "Thor: Love and Thunder",
      "overview":
          "After his retirement is interrupted by Gorr the God Butcher, a galactic killer who seeks the extinction of the gods, Thor Odinson enlists the help of King Valkyrie, Korg, and ex-girlfriend Jane Foster, who now wields Mjolnir as the Mighty Thor. Together they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butcher’s vengeance and stop him before it’s too late.",
      "popularity": 1404.107,
      "poster_path": "/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg",
      "release_date": "2022-07-06",
      "title": "Thor: Love and Thunder",
      "video": false,
      "vote_average": 6.7,
      "vote_count": 4625
    },
    {
      "adult": false,
      "backdrop_path": "/3Ykwi0ObNpqy5gAwhddmxKWs1dp.jpg",
      "genre_ids": [53, 18],
      "id": 848526,
      "original_language": "fr",
      "original_title": "Arsenault & Fils",
      "overview": "Follows the Arsenaults, a small-time poach family in Témiscouata, Quebec.",
      "popularity": 1344.132,
      "poster_path": "/2symxAMYXpJ9mJ8YOc2b5ZEKIAQ.jpg",
      "release_date": "2022-06-17",
      "title": "Family Game",
      "video": false,
      "vote_average": 5.1,
      "vote_count": 5
    }
  ],
  "total_pages": 35876,
  "total_results": 717511
};
