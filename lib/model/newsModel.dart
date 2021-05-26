// To parse this JSON data, do
//
//     final newapi = newapiFromJson(jsonString);

import 'dart:convert';

List<Newapi> newapiFromJson(String str) => List<Newapi>.from(json.decode(str).map((x) => Newapi.fromJson(x)));

String newapiToJson(List<Newapi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Newapi {
  Newapi({
    this.id,
    this.title,
    this.url,
    this.imageUrl,
    this.newsSite,
    this.summary,
    this.publishedAt,
    this.updatedAt,
    this.featured,
    this.launches,
    this.events,
  });

  int? id;
  String? title;
  String? url;
  String? imageUrl;
  String? newsSite;
  String? summary;
  var publishedAt;
  var updatedAt;
  bool? featured;
  List<Launch>? launches;
  List<dynamic>? events;

  factory Newapi.fromJson(Map<String, dynamic> json) => Newapi(
    id: json["id"],
    title: json["title"],
    url: json["url"],
    imageUrl: json["imageUrl"],
    newsSite: json["newsSite"],
    summary: json["summary"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    featured: json["featured"],
    launches: List<Launch>.from(json["launches"].map((x) => Launch.fromJson(x))),
    events: List<dynamic>.from(json["events"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "url": url,
    "imageUrl": imageUrl,
    "newsSite": newsSite,
    "summary": summary,
    "publishedAt": publishedAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "featured": featured,
    "launches": List<dynamic>.from(launches!.map((x) => x.toJson())),
    "events": List<dynamic>.from(events!.map((x) => x)),
  };
}

class Launch {
  Launch({
    this.id,
    this.provider,
  });

  String? id;
  String? provider;

  factory Launch.fromJson(Map<String, dynamic> json) => Launch(
    id: json["id"],
    provider: json["provider"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "provider": provider,
  };
}
