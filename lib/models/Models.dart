// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  Model({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  final int? page;
  final List<Result>? results;
  final int? totalPages;
  final int? totalResults;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    page: json["page"],
    results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": results == null ? null : List<dynamic>.from(results!.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class Result {
  Result({
    this.backdropPath,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.overview,
    this.releaseDate,
    this.title,
    this.id,
    this.adult,
    this.popularity,
    this.mediaType,
  });

  final String? backdropPath;
  final List<int>? genreIds;
  final OriginalLanguage? originalLanguage;
  final String? originalTitle;
  final String? posterPath;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final String? overview;
  final DateTime? releaseDate;
  final String? title;
  final int? id;
  final bool? adult;
  final double? popularity;
  final MediaType? mediaType;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    backdropPath: json["backdrop_path"],
    genreIds: json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"].map((x) => x)),
    originalLanguage: json["original_language"] == null ? null : originalLanguageValues.map?[json["original_language"]],
    originalTitle: json["original_title"],
    posterPath: json["poster_path"],
    video: json["video"],
    voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
    overview: json["overview"],
    releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
    title: json["title"],
    id: json["id"],
    adult: json["adult"],
    popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
    mediaType: json["media_type"] == null ? null : mediaTypeValues.map?[json["media_type"]],
  );

  Map<String, dynamic> toJson() => {
    "backdrop_path": backdropPath,
    "genre_ids": genreIds == null ? null : List<dynamic>.from(genreIds!.map((x) => x)),
    "original_language": originalLanguage == null ? null : originalLanguageValues.reverse?[originalLanguage],
    "original_title": originalTitle,
    "poster_path": posterPath,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
    "overview": overview,
    "release_date": releaseDate == null ? null : "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
    "title": title,
    "id": id,
    "adult": adult,
    "popularity": popularity,
    "media_type": mediaType == null ? null : mediaTypeValues.reverse?[mediaType],
  };
}

enum MediaType { MOVIE }

final mediaTypeValues = EnumValues({
  "movie": MediaType.MOVIE
});

enum OriginalLanguage { EN }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
