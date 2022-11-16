// To parse this JSON data, do
//
//     final listMovieResponse = listMovieResponseFromJson(jsonString);

import 'dart:convert';

class MovieDetailResponse {
    MovieDetailResponse({
        required this.adult,
        required this.backdropPath,
        required this.belongsToCollection,
        required this.budget,
        required this.genres,
        required this.homepage,
        required this.id,
        required this.imdbId,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.productionCompanies,
        required this.productionCountries,
        required this.releaseDate,
        required this.revenue,
        required this.runtime,
        required this.spokenLanguages,
        required this.status,
        required this.tagline,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    final bool adult;
    final String backdropPath;
    final dynamic belongsToCollection;
    final int budget;
    final List<int> genres;
    final String homepage;
    final int id;
    final String imdbId;
    final String originalLanguage;
    final String originalTitle;
    final String overview;
    final double popularity;
    final String posterPath;
    final List<ProductionCompany> productionCompanies;
    final List<ProductionCountry> productionCountries;
    final DateTime releaseDate;
    final int revenue;
    final int runtime;
    final List<SpokenLanguage> spokenLanguages;
    final String status;
    final String tagline;
    final String title;
    final bool video;
    final double voteAverage;
    final int voteCount;

    MovieDetailResponse copyWith({
        bool? adult,
        String? backdropPath,
        dynamic? belongsToCollection,
        int? budget,
        List<int>? genres,
        String? homepage,
        int? id,
        String? imdbId,
        String? originalLanguage,
        String? originalTitle,
        String? overview,
        double? popularity,
        String? posterPath,
        List<ProductionCompany>? productionCompanies,
        List<ProductionCountry>? productionCountries,
        DateTime? releaseDate,
        int? revenue,
        int? runtime,
        List<SpokenLanguage>? spokenLanguages,
        String? status,
        String? tagline,
        String? title,
        bool? video,
        double? voteAverage,
        int? voteCount,
    }) => 
        MovieDetailResponse(
            adult: adult ?? this.adult,
            backdropPath: backdropPath ?? this.backdropPath,
            belongsToCollection: belongsToCollection ?? this.belongsToCollection,
            budget: budget ?? this.budget,
            genres: genres ?? this.genres,
            homepage: homepage ?? this.homepage,
            id: id ?? this.id,
            imdbId: imdbId ?? this.imdbId,
            originalLanguage: originalLanguage ?? this.originalLanguage,
            originalTitle: originalTitle ?? this.originalTitle,
            overview: overview ?? this.overview,
            popularity: popularity ?? this.popularity,
            posterPath: posterPath ?? this.posterPath,
            productionCompanies: productionCompanies ?? this.productionCompanies,
            productionCountries: productionCountries ?? this.productionCountries,
            releaseDate: releaseDate ?? this.releaseDate,
            revenue: revenue ?? this.revenue,
            runtime: runtime ?? this.runtime,
            spokenLanguages: spokenLanguages ?? this.spokenLanguages,
            status: status ?? this.status,
            tagline: tagline ?? this.tagline,
            title: title ?? this.title,
            video: video ?? this.video,
            voteAverage: voteAverage ?? this.voteAverage,
            voteCount: voteCount ?? this.voteCount,
        );

    factory MovieDetailResponse.fromRawJson(String str) => MovieDetailResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MovieDetailResponse.fromJson(Map<String, dynamic> json) => MovieDetailResponse(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"],
        genres: List<int>.from(json["genres"].map((x) => x['id'])),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: List<ProductionCompany>.from(json["production_companies"].map((x) => ProductionCompany.fromJson(x))),
        productionCountries: List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromJson(x))),
        releaseDate: DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection,
        "budget": budget,
        "genres": genres,
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies": List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
        "production_countries": List<dynamic>.from(productionCountries.map((x) => x.toJson())),
        "release_date": releaseDate.toIso8601String().split('T')[0],
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages": List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}


class ProductionCompany {
    ProductionCompany({
        required this.id,
        this.logoPath,
        this.name,
        this.originCountry,
    });

    final int id;
    final String? logoPath;
    final String? name;
    final String? originCountry;

    factory ProductionCompany.fromRawJson(String str) => ProductionCompany.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProductionCompany.fromJson(Map<String, dynamic> json) => ProductionCompany(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
    };
}


class ProductionCountry {
    ProductionCountry({
        this.iso31661,
        this.name,
    });

    final String? iso31661;
    final String? name;

    factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
        iso31661: json["iso_3166_1"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
    };
}

class SpokenLanguage {
    SpokenLanguage({
        this.englishName,
        this.iso6391,
        this.name,
    });

    final String? englishName;
    final String? iso6391;
    final String? name;


    factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
    };
}
