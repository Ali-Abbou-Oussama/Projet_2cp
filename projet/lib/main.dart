import 'package:flutter/material.dart';

import 'moduls/login/login_screen.dart';

// Importez le fichier contenant le widget `WeightChart`.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginView(),
    );
  }
}
