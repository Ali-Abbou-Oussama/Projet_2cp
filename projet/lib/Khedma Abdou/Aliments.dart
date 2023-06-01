// ignore_for_file: file_names

class Aliments {
  String? name;
  double? calories;
  double? proteins;
  double? carbohydrates;
  double? lipids;

  Aliments({
    this.calories,
    this.carbohydrates,
    this.lipids,
    this.name,
    this.proteins,
  });

  Aliments.fromJson(Map<String, dynamic> json) {
    calories = (json["calories"] as num?)?.toDouble();
    carbohydrates = (json["carbohydrates"] as num?)?.toDouble();
    lipids = (json["lipids"] as num?)?.toDouble();
    name = json["name"] as String?;
    proteins = (json["proteins"] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["calories"] = calories;
    data["carbohydrates"] = carbohydrates;
    data["lipids"] = lipids;
    data["name"] = name;
    data["proteins"] = proteins;
    return data;
  }
}
