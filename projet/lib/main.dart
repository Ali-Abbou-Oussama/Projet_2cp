import 'package:firebase_core/firebase_core.dart';

import 'package:fitness/moduls/login/login/login_screen.dart';
import 'package:fitness/moduls/secreen_home.dart';
import 'package:fitness/shared/cubit/cubit.dart';
import 'package:fitness/shared/cubit/states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getFitCubit()..getUserData(),
        ),
      ],
      child: BlocConsumer<getFitCubit, getFitStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: loginView1(),
          );
        },
      ),
    );
  }
}
