// To parse this JSON data, do
//
//     final playersModel = playersModelFromJson(jsonString);

import 'dart:convert';

List<PlayersModel> playersModelFromJson(String str) => List<PlayersModel>.from(json.decode(str).map((x) => PlayersModel.fromJson(x)));

String playersModelToJson(List<PlayersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlayersModel {
    final String id;
    final String? name;
    final String? surname;
    final int? age;
    final String? ism;
    final int? yosh;

    PlayersModel({
        required this.id,
        this.name,
        this.surname,
        this.age,
        this.ism,
        this.yosh,
    });

    factory PlayersModel.fromJson(Map<String, dynamic> json) => PlayersModel(
        id: json["id"],
        name: json["name"],
        surname: json["surname"],
        age: json["age"],
        ism: json["ism"],
        yosh: json["yosh"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "surname": surname,
        "age": age,
        "ism": ism,
        "yosh": yosh,
    };
}