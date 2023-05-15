import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/models/user_model.dart';
import 'package:fitness/moduls/login/cubit/states.dart';
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
              ),
            })
        .catchError((error) {
      emit(GetfitRegisterErrorState(error.toString()));
    });
  }

  void userCreate(
      {required String username,
      required String email,
      required String uId,
      required String goal,
      required int age,
      required double weight,
      required int height,
      required String gender}) {
    userModel model = userModel(
      gender: gender,
      height: height,
      email: email,
      userName: username,
      uId: uId,
      goal: goal,
      age: age,
      weight: weight,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(GetfitCreateUserSuccessState());
    }).catchError((error) {
      emit(GetfitCreateUsertErrorState(error.toString()));
    });
  }
}
