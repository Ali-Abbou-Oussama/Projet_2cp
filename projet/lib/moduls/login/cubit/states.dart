abstract class GetfitLoginStates {}

class GetfitLoginInitialState extends GetfitLoginStates {}

class GetfitLoginLoadingState extends GetfitLoginStates {}

class GetfitLoginSuccessState extends GetfitLoginStates {}

class GetfitLoginErrorState extends GetfitLoginStates {
  final String error;
  GetfitLoginErrorState(this.error);
}
