import 'dart:convert';

PokeModel pokeModelFromJson(String str) => PokeModel.fromJson(json.decode(str));

String pokeModelToJson(PokeModel data) => json.encode(data.toJson());

class PokeModel {
  PokeModel({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory PokeModel.fromJson(Map<String, dynamic> json) => PokeModel(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
