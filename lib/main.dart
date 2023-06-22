import 'package:flutter/material.dart';
import 'package:hava_durumu/Sayfalar/hava_durumu_sayfasi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HavaDurumuSayfasi(),
    );
  }
}
