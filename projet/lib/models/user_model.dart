class userModel {
  String userName;
  String email;
  String uId;
  int age;
  double weight;
  String goal;
  int height;
  String gender;

  userModel({
    required this.email,
    required this.uId,
    required this.userName,
    required this.age,
    required this.weight,
    required this.goal,
    required this.height,
    required this.gender,
  });

  userModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        userName = json['userName'],
        uId = json['uId'],
        age = json['age'],
        weight = json['weight'],
        goal = json['goal'],
        height = json['height'],
        gender = json['gender'];
  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'uId': uId,
      'age': age,
      'weight': weight,
      'goal': goal,
      'height': height,
      'gender': gender,
    };
  }
}
