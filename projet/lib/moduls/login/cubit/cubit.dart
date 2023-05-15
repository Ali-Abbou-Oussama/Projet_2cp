import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/moduls/login/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<GetfitLoginStates> {
  LoginCubit() : super(GetfitLoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required email,
    required password,
  }) {
    emit(GetfitLoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(GetfitLoginSuccessState());
    }).catchError((error) {
      emit(GetfitLoginErrorState(error.toString()));
    });
  }
}
