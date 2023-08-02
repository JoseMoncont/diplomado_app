// To parse this JSON data, do
//
//     final categoriaResponse = categoriaResponseFromJson(jsonString);

import 'dart:convert';

CategoriaResponse categoriaResponseFromJson(String str) =>
    CategoriaResponse.fromJson(json.decode(str));

String categoriaResponseToJson(CategoriaResponse data) =>
    json.encode(data.toJson());

class CategoriaResponse {
  Success? success;
  Contents? contents;
  Copyright? copyright;

  CategoriaResponse({
    this.success,
    this.contents,
    this.copyright,
  });

  factory CategoriaResponse.fromJson(Map<String, dynamic> json) =>
      CategoriaResponse(
        success:
            json["success"] == null ? null : Success.fromJson(json["success"]),
        contents: json["contents"] == null
            ? null
            : Contents.fromJson(json["contents"]),
        copyright: json["copyright"] == null
            ? null
            : Copyright.fromJson(json["copyright"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success?.toJson(),
        "contents": contents?.toJson(),
        "copyright": copyright?.toJson(),
      };
}

class Contents {
  Categories? categories;

  Contents({
    this.categories,
  });

  factory Contents.fromJson(Map<String, dynamic> json) => Contents(
        categories: json["categories"] == null
            ? null
            : Categories.fromJson(json["categories"]),
      );

  Map<String, dynamic> toJson() => {
        "categories": categories?.toJson(),
      };
}

class Categories {
  String? inspire;
  String? life;
  String? love;
  String? management;
  String? sports;
  String? funny;
  String? art;
  String? students;

  Categories({
    this.inspire,
    this.life,
    this.love,
    this.management,
    this.sports,
    this.funny,
    this.art,
    this.students,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        inspire: json["inspire"],
        life: json["life"],
        love: json["love"],
        management: json["management"],
        sports: json["sports"],
        funny: json["funny"],
        art: json["art"],
        students: json["students"],
      );

  Map<String, dynamic> toJson() => {
        "inspire": inspire,
        "life": life,
        "love": love,
        "management": management,
        "sports": sports,
        "funny": funny,
        "art": art,
        "students": students,
      };
}

class Copyright {
  String? url;
  String? year;

  Copyright({
    this.url,
    this.year,
  });

  factory Copyright.fromJson(Map<String, dynamic> json) => Copyright(
        url: json["url"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "year": year,
      };
}

class Success {
  int? total;

  Success({
    this.total,
  });

  factory Success.fromJson(Map<String, dynamic> json) => Success(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}
