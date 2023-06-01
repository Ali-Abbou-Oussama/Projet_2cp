abstract class getFitStates {}

class getFitInitialState extends getFitStates {}

class getFitGetUserLoadingState extends getFitStates {}

class getFitGetUserSuccessState extends getFitStates {}

class getFitGetUserErrorState extends getFitStates {
  final String error;
  getFitGetUserErrorState(this.error);
}

class getFitChangeBottomNav extends getFitStates {}

class getFitUserUpdateErrorState extends getFitStates {
  final String error;
  getFitUserUpdateErrorState(this.error);
}
