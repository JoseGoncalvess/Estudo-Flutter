// To parse this JSON data, do
//
//     final FoodModel = FoodModelFromJson(jsonString);

import 'dart:convert';

//TRANBSFORMA NOSOS MODELO D ESTRING EM UMA MODELO JSON
List<FoodModel> foodModelFromJson(String str) =>
    List<FoodModel>.from(json.decode(str).map((x) => FoodModel.fromJson(x)));
//TRASNFORMA O MODELO JSON E UMA STRING
String foodModelToJson(List<FoodModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

//CRIO UMA CALSSE COM OS PARAMETROS QUE VOU PRECISAR
class FoodModel {
  FoodModel({
    required this.id,
    required this.name,
    required this.price,
  });
//PARAMETROS
  String id;
  String name;
  String price;
//TRASNFORMO OS RETONO DA API EM UMA JSON DO MODELO
  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
      );
  // TRANSFORMO LISTA DE MAP EM UM JSON
  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
      };
}
