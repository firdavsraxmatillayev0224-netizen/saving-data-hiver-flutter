import 'package:dio/dio.dart';
import 'package:flutter33/model/player_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PlayerService {
  // Dioni ishga tushirish
  final Dio dio = Dio();

  // Hive ichidegi boxni chaqirish
  final box = Hive.box("playerBox");

  Future<List<PlayersModel>> getPlayers() async {
    try {
      // APIdan malumotni olish
      var response = await dio.get(
        "https://6ab52bbc24ee9d3caa1c43aa.mockapi.io/api",
      );

      List data = response.data;
      // Hivega malumotlarni saqlash
      await box.put("player", response.data);

      return (data as List).map((item) => PlayersModel.fromJson(item)).toList();
    } catch (e) {
      print("APIdan uzilish bo'ldi");

      var savedData = box.get("player");

      if (savedData == null) {
        return [];
      }

      return (savedData as List)
          .map((item) => PlayersModel.fromJson(Map<String, dynamic>.from(item)))
          .toList();
    }
  }
}
