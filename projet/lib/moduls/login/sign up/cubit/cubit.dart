// ignore_for_file: body_might_complete_normally_catch_error, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/models/user_model.dart';
import 'package:fitness/moduls/login/sign%20up/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<GetfitRegisterStates> {
  RegisterCubit() : super(GetfitRegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String username,
    required String email,
    required String password,
    required int age,
    required double weight,
    required String goal,
    required String gender,
    required int height,
    required int calories,
    required String activitylevel,
    required int remaining,
    required int eaten,
  }) {
    emit(GetfitRegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {
              print(value.user!.email),
              print(value.user!.uid),
              userCreate(
                gender: gender,
                height: height,
                goal: goal,
                weight: weight,
                age: age,
                username: username,
                email: email,
                uId: value.user!.uid,
                activitylevel: activitylevel,
                calories: calories,
                remaining: remaining,
                eaten: eaten,
              ),
            })
        .catchError((error) {
      emit(GetfitRegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String username,
    required String email,
    required String uId,
    required String goal,
    required int age,
    required double weight,
    required int height,
    required String gender,
    required String activitylevel,
    required int calories,
    required int remaining,
    required int eaten,
  }) {
    userModel model = userModel(
      gender: gender,
      height: height,
      email: email,
      userName: username,
      uId: uId,
      goal: goal,
      age: age,
      weight: weight,
      activityLevel: activitylevel,
      calories: calories,
      eaten: eaten,
      remaining: remaining,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toJson())
        .then((value) {
      emit(GetfitCreateUserSuccessState());
    }).catchError((error) {
      emit(GetfitCreateUsertErrorState(error.toString()));
    });
  }
}
