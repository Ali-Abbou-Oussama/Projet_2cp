import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'moduls/profiles/profile.dart';

// Importez le fichier contenant le widget `WeightChart`.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: profilescreen(),
      ),
    );
  }
}
