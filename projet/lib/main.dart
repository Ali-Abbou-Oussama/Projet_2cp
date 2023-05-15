import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/moduls/login/authentification/Authentification%201/gender.dart';

import 'package:fitness/moduls/login/login/login_screen.dart';
import 'package:fitness/moduls/secreen_home.dart';
import 'package:flutter/material.dart';

// Importez le fichier contenant le widget `WeightChart`.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginView1(),
    );
  }
}
