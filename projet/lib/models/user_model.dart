// ignore_for_file: camel_case_types

class userModel {
  String? userName;
  String? email;
  String? uId;
  int? age;
  double? weight;
  String? goal;
  int? height;
  String? gender;
  String? activityLevel;
  int? calories;
  int? remaining;
  int? eaten;

  userModel({
    required this.email,
    required this.uId,
    required this.userName,
    required this.age,
    required this.weight,
    required this.goal,
    required this.height,
    required this.gender,
    required this.activityLevel,
    required this.calories,
    required this.remaining,
    required this.eaten,
  });

  userModel.fromJson(Map<String, dynamic>? json) {
    email = json!["email"] as String?;
    userName = json['userName'] as String?;
    uId = json['uId'] as String?;
    age = (json["age"] as num?)?.toInt();
    weight = (json["weight"] as num?)?.toDouble();
    goal = json['goal'] as String?;
    height = (json["height"] as num?)?.toInt();
    gender = json['gender'] as String?;
    activityLevel = json['activityLevel'] as String?;
    calories = (json["calories"] as num?)?.toInt();
    remaining = (json["remaining"] as num?)?.toInt();
    eaten = (json["eaten"] as num?)?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["userName"] = userName;
    data["uId"] = uId;
    data["age"] = age;
    data["weight"] = weight;
    data["goal"] = goal;
    data["height"] = height;
    data["gender"] = gender;
    data["activityLevel"] = activityLevel;
    data["calories"] = calories;
    data["remaining"] = remaining;
    data["eaten"] = eaten;
    return data;
  }
}
