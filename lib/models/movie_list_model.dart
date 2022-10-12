// To parse this JSON data, do
//
//     final movieDetails = movieDetailsFromJson(jsonString);

import 'dart:convert';

MovieDetails movieDetailsFromJson(String str) =>
    MovieDetails.fromJson(json.decode(str));

String movieDetailsToJson(MovieDetails data) => json.encode(data.toJson());

class MovieDetails {
  MovieDetails({
    this.characters,
    this.series,
  });

  List<Character>? characters;
  Series? series;

  factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
        characters: List<Character>.from(
            json["characters"].map((x) => Character.fromJson(x))),
        series: Series.fromJson(json["series"]),
      );

  Map<String, dynamic> toJson() => {
        "characters": List<dynamic>.from(characters!.map((x) => x.toJson())),
        "series": series!.toJson(),
      };
}

class Character {
  Character({
    this.id,
    this.name,
    this.age,
    this.profession,
    this.img,
  });

  int? id;
  String? name;
  int? age;
  String? profession;
  String? img;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        profession: json["profession"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "profession": profession,
        "img": img,
      };
}

class Series {
  Series({
    this.title,
    this.ott,
    this.img,
    this.desc,
  });

  String? title;
  String? ott;
  String? img;
  String? desc;

  factory Series.fromJson(Map<String, dynamic> json) => Series(
        title: json["title"],
        ott: json["ott"],
        img: json["img"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "ott": ott,
        "img": img,
        "desc": desc,
      };
}
