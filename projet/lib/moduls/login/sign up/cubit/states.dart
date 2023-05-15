abstract class GetfitRegisterStates {}

class GetfitRegisterInitialState extends GetfitRegisterStates {}

class GetfitRegisterLoadingState extends GetfitRegisterStates {}

class GetfitRegisterSuccessState extends GetfitRegisterStates {}

class GetfitRegisterErrorState extends GetfitRegisterStates {
  final String error;
  GetfitRegisterErrorState(this.error);
}

class GetfitCreateUserSuccessState extends GetfitRegisterStates {}

class GetfitCreateUsertErrorState extends GetfitRegisterStates {
  final String error;
  GetfitCreateUsertErrorState(this.error);
}
