import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/models/user_model.dart';

import 'package:fitness/moduls/secreen_home.dart';
import 'package:fitness/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Khedma Abdou/Aliments.dart';
import '../../moduls/Breakfast.dart';
import '../../moduls/Dinner.dart';
import '../../moduls/Home_page.dart';
import '../../moduls/Lunch.dart';
import '../../moduls/cookbook/cookbook.dart';
import '../../moduls/exercice.dart';
import '../../moduls/profiles/profile.dart';

class getFitCubit extends Cubit<getFitStates> {
  late List<Aliments?>? listAlimentsBreakfast;
  late double? caloriesConsumedBreakfast;
  late List<Aliments?>? listAlimentsLunch;
  late double? caloriesConsumedLunch;
  late List<Aliments?>? listAlimentsDinner;
  late double? caloriesConsumedDinner;
  late Breakfast? screenBreakfast;
  late Dinner? screenDinner;
  late Lunch? screenLunch;
  getFitCubit({
    this.screenDinner,
    this.screenLunch,
    this.caloriesConsumedBreakfast = 0,
    this.caloriesConsumedDinner = 0,
    this.caloriesConsumedLunch = 0,
    this.listAlimentsBreakfast,
    this.listAlimentsDinner,
    this.listAlimentsLunch,
    this.screenBreakfast,
  }) : super(getFitInitialState()) {
    screens[2] = homeview(
        screenLunch: screenLunch,
        screenDinner: screenDinner,
        caloriesConsumedBreakfast: caloriesConsumedBreakfast,
        caloriesConsumedDinner: caloriesConsumedDinner,
        caloriesConsumedLunch: caloriesConsumedLunch,
        listAlimentsBreakfast: listAlimentsBreakfast,
        listAlimentsDinner: listAlimentsDinner,
        listAlimentsLunch: listAlimentsLunch,
        screenBreakfast: screenBreakfast);
  }

  static getFitCubit get(context) => BlocProvider.of(context);

  userModel? model;

  int calories = 0;
  int age = 0;
  double weight = 20;
  String activityLevel = '';
  int height = 100;
  String goal = '';
  String email = '';
  String username = '';
  String gender = '';
  String uida = '';

  var uid = FirebaseAuth.instance.currentUser!.uid;

  void getUserData() {
    emit(getFitGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      final data = value.data();

      if (data != null) {
        calories = data['calories'] ?? 0;
        age = data['age'] ?? 0;
        print(age);
        weight = data['weight'] ?? 20.0;
        print(data['weight']);
        activityLevel = data['activityLevel'] ?? '';
        print(data['weight']);
        height = data['height'] ?? 100;
        print(data['height']);
        goal = data['goal'] ?? '';
        email = data['email'] ?? '';
        username = data['username'] ?? '';
        gender = data['gender'] ?? '';
        uida = data['uid'] ?? '';

        model = userModel.fromJson(data);
        print(model);

        emit(getFitGetUserSuccessState());
      }
    }).catchError((error) {
      emit(getFitGetUserErrorState(error.toString()));
    });
  }

  int currentIndex = 2;
  List<Widget> screens = [
    const HomePage(),
    const cookbk(),
    homeview(),
    const workout(),
    const profilescreen(),
  ];

  void changeBotomNav(int index) {
    currentIndex = index;
    emit(getFitChangeBottomNav());
  }

  void updateWeight({
    required double wight,
    required int calori,
  }) {
    userModel usermodel = userModel(
      email: model!.email,
      gender: model!.gender,
      uId: model!.uId,
      userName: model!.userName,
      height: model!.height,
      goal: model!.goal,
      age: model!.age,
      weight: wight,
      activityLevel: model!.activityLevel,
      calories: calori,
      remaining: model!.remaining,
      eaten: model!.eaten,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update(usermodel.toJson())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(getFitUserUpdateErrorState(error.toString()));
    });
  }

  void updateHeight({
    required int height,
    required int calori,
  }) {
    userModel usermodel = userModel(
      email: model!.email,
      gender: model!.gender,
      uId: model!.uId,
      userName: model!.userName,
      height: height,
      goal: model!.goal,
      age: model!.age,
      weight: model!.weight,
      activityLevel: model!.activityLevel,
      calories: calori,
      remaining: model!.remaining,
      eaten: model!.eaten,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update(usermodel.toJson())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(getFitUserUpdateErrorState(error.toString()));
    });
  }

  void updateAge({
    required int age,
    required int calori,
  }) {
    userModel usermodel = userModel(
      email: model!.email,
      gender: model!.gender,
      uId: model!.uId,
      userName: model!.userName,
      height: model!.height,
      goal: model!.goal,
      age: age,
      weight: model!.weight,
      activityLevel: model!.activityLevel,
      calories: calori,
      remaining: model!.remaining,
      eaten: model!.eaten,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update(usermodel.toJson())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(getFitUserUpdateErrorState(error.toString()));
    });
  }

  void updateActivitylevel({
    required String activityLevel,
    required int calori,
  }) {
    userModel usermodel = userModel(
      email: model!.email,
      gender: model!.gender,
      uId: model!.uId,
      userName: model!.userName,
      height: model!.height,
      goal: model!.goal,
      age: model!.age,
      weight: model!.weight,
      activityLevel: activityLevel,
      calories: calori,
      remaining: model!.remaining,
      eaten: model!.eaten,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update(usermodel.toJson())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(getFitUserUpdateErrorState(error.toString()));
    });
  }

  void updateGoal({
    required String Goal,
    required int calori,
  }) {
    userModel usermodel = userModel(
      email: model!.email,
      gender: model!.gender,
      uId: model!.uId,
      userName: model!.userName,
      height: model!.height,
      goal: Goal,
      age: model!.age,
      weight: model!.weight,
      activityLevel: model!.activityLevel,
      calories: calori,
      remaining: model!.remaining,
      eaten: model!.eaten,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update(usermodel.toJson())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(getFitUserUpdateErrorState(error.toString()));
    });
  }

  void updateCalories({
    required int calori,
  }) {
    userModel usermodel = userModel(
      email: model!.email,
      gender: model!.gender,
      uId: model!.uId,
      userName: model!.userName,
      height: model!.height,
      goal: model!.goal,
      age: model!.age,
      weight: model!.weight,
      activityLevel: model!.activityLevel,
      calories: calori,
      remaining: model!.remaining,
      eaten: model!.eaten,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update(usermodel.toJson())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(getFitUserUpdateErrorState(error.toString()));
    });
  }
}
