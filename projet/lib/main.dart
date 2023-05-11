import 'package:fitness/moduls/Breakfast.dart';
import 'package:fitness/moduls/login/login_screen.dart';
import 'package:fitness/moduls/secreen_home.dart';
import 'package:flutter/material.dart';

// Importez le fichier contenant le widget `WeightChart`.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginView(),
    );
  }
}
