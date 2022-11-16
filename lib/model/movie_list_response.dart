// To parse this JSON data, do
//
//     final listMovieResponse = listMovieResponseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_starter_private/utils/converter.dart';

class ListMovieResponse {
  ListMovieResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<MovieData> results;
  final int totalPages;
  final int totalResults;

  ListMovieResponse copyWith({
    int? page,
    List<MovieData>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      ListMovieResponse(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  factory ListMovieResponse.fromRawJson(String str) => ListMovieResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListMovieResponse.fromJson(Map<String, dynamic> json) => ListMovieResponse(
        page: json["page"],
        results: jsonToList<MovieData>(json["results"], MovieData.fromJson, returnEmpty: false),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class MovieData {
  MovieData({
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.genreIds,
    this.posterPath,
    this.poster,
    required this.releaseDate,
    required this.title,
    required this.director,
    required this.voteAverage,
    required this.voteCount,
  });

  final String backdropPath;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final List<int> genreIds;
  final double popularity;
  final String? posterPath;
  final String? poster;
  final DateTime releaseDate;
  final String title;
  final String director;
  final double voteAverage;
  final int voteCount;

  MovieData copyWith({
    String? backdropPath,
    int? id,
    List<int>? genreIds,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? poster,
    DateTime? releaseDate,
    String? title,
    String? director,
    double? voteAverage,
    int? voteCount,
  }) =>
      MovieData(
        backdropPath: backdropPath ?? this.backdropPath,
        id: id ?? this.id,
        genreIds: genreIds ?? this.genreIds,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        poster: poster ?? this.poster,
        releaseDate: releaseDate ?? this.releaseDate,
        title: title ?? this.title,
        director: director ?? this.director,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );

  factory MovieData.fromRawJson(String str) => MovieData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  // di tmdb harus 2 kali buat ambil director
  factory MovieData.fromJson(Map<String, dynamic> json) => MovieData(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        director: "No Director",
        genreIds: checkAndDecode<List<int>>(json["genre_ids"]) ?? [],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate.toIso8601String(),
        "title": title,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "genre_ids": json.encode(genreIds),
      };
}

class MovieField {
  static const values = [backdropPath, id, originalLanguage, originalTitle, overview, popularity, posterPath, releaseDate, title, voteAverage, voteCount];
  static const backdropPath = "backdrop_path";
  static const id = "id";
  static const originalLanguage = "original_language";
  static const originalTitle = "original_title";
  static const overview = "overview";
  static const popularity = "popularity";
  static const posterPath = "poster_path";
  static const releaseDate = "release_date";
  static const title = "title";
  static const voteAverage = "vote_average";
  static const voteCount = "vote_count";
  static const genreIds = "genre_ids";
}
