import 'package:flutter/material.dart';
import 'package:flutter33/home.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hiveni ishga tushirish
  await Hive.initFlutter();

  // Hiveda box ochish
  await Hive.openBox("playerBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}