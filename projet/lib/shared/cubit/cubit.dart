import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/models/user_model.dart';

import 'package:fitness/moduls/exercices/exercices.dart';

import 'package:fitness/moduls/secreen_home.dart';
import 'package:fitness/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../moduls/Home_page.dart';
import '../../moduls/cookbook/cookbook.dart';
import '../../moduls/profiles/profile.dart';

class getFitCubit extends Cubit<getFitStates> {
  getFitCubit() : super(getFitInitialState());

  static getFitCubit get(context) => BlocProvider.of(context);

  userModel? model;

  int? Function()? cal;
  int calories = 0;

  final uid = FirebaseAuth.instance.currentUser!.uid;

  void getUserData() {
    emit(getFitGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      final data =
          value.data() as Map<String, dynamic>?; // Cast to Map<String, dynamic>
      if (data != null) {
        calories = data['calories'];
        print(calories);
        int? cal() {
          return calories;
        }

        model = userModel.fromJson(data);
        print(model);
        emit(getFitGetUserSuccessState());
      }
    }).catchError((error) {
      emit(getFitGetUserErrorState(error.toString()));
    });
  }

  int currentIndex = 4;
  List<Widget> screens = [
    HomePage(),
    cookbk(),
    homeview(),
    exercices(),
    profilescreen(),
  ];

  void changeBotomNav(int index) {
    currentIndex = index;
    emit(getFitChangeBottomNav());
  }
}
