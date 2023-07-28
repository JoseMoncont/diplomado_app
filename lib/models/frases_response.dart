// To parse this JSON data, do
//
//     final fraseResponse = fraseResponseFromJson(jsonString);

import 'dart:convert';

FraseResponse fraseResponseFromJson(String str) =>
    FraseResponse.fromJson(json.decode(str));

String fraseResponseToJson(FraseResponse data) => json.encode(data.toJson());

class FraseResponse {
  Success? success;
  Contents? contents;
  Copyright? copyright;

  FraseResponse({
    this.success,
    this.contents,
    this.copyright,
  });

  factory FraseResponse.fromJson(String str) =>
      FraseResponse.fromMap(json.decode(str));

  factory FraseResponse.fromMap(Map<String, dynamic> json) => FraseResponse(
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
  List<Quote>? quotes;

  Contents({
    this.quotes,
  });

  factory Contents.fromJson(Map<String, dynamic> json) => Contents(
        quotes: json["quotes"] == null
            ? []
            : List<Quote>.from(json["quotes"]!.map((x) => Quote.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "quotes": quotes == null
            ? []
            : List<dynamic>.from(quotes!.map((x) => x.toJson())),
      };
}

class Quote {
  String? id;
  String? quote;
  int? length;
  String? author;
  String? language;
  List<String>? tags;
  String? sfw;
  String? permalink;
  String? title;
  String? category;
  String? background;
  DateTime? date;

  Quote({
    this.id,
    this.quote,
    this.length,
    this.author,
    this.language,
    this.tags,
    this.sfw,
    this.permalink,
    this.title,
    this.category,
    this.background,
    this.date,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        id: json["id"],
        quote: json["quote"],
        length: json["length"],
        author: json["author"],
        language: json["language"],
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        sfw: json["sfw"],
        permalink: json["permalink"],
        title: json["title"],
        category: json["category"],
        background: json["background"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quote": quote,
        "length": length,
        "author": author,
        "language": language,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "sfw": sfw,
        "permalink": permalink,
        "title": title,
        "category": category,
        "background": background,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
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
