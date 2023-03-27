// To parse this JSON data, do
//
//     final moviesModel = moviesModelFromJson(jsonString);

import 'dart:convert';

MoviesModel moviesModelFromJson(String str) =>
    MoviesModel.fromJson(json.decode(str));

String moviesModelToJson(MoviesModel data) => json.encode(data.toJson());

class MoviesModel {
  MoviesModel({
    this.search,
    this.totalResults,
    this.response,
  });

  List<Search?>? search;
  String? totalResults;
  String? response;

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        search: json["Search"] == null
            ? null
            : List<Search>.from(json["Search"]?.map((x) => Search.fromJson(x))),
        totalResults: json["totalResults"],
        response: json["Response"],
      );

  Map<String, dynamic> toJson() => {
        "Search": search == null
            ? null
            : List<dynamic>.from(search!.map((x) => x?.toJson())),
        "totalResults": totalResults,
        "Response": response,
      };
}

class Search {
  Search({
    this.title,
    this.year,
    this.imdbId,
    this.type,
    this.poster,
  });

  String? title;
  String? year;
  String? imdbId;
  String? type;
  String? poster;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: json["Type"],
        poster: json["Poster"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "Type": type,
        "Poster": poster,
      };
}
