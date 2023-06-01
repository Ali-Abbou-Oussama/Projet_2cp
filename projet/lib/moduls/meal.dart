// ignore_for_file: camel_case_types, avoid_unnecessary_containers, must_be_immutable, avoid_init_to_null

import 'package:fitness/Khedma%20Abdou/Aliments.dart';
import 'package:fitness/Khedma%20Abdou/MealWidget.dart';
import 'package:fitness/Khedma%20Abdou/SearchMeal.dart';
import 'package:fitness/moduls/Breakfast.dart';
import 'package:fitness/moduls/Dinner.dart';
import 'package:fitness/moduls/Lunch.dart';
import 'package:flutter/material.dart';

import '../Khedma Abdou/AlimentsInfoWidget.dart';

class meal extends StatefulWidget {
  List<MealWidget>? listeMeal;
  List<Aliments?>? listAlimentsBreakfast;
  List<Aliments?>? listAlimentsMeal;
  double? caloriesConsumedBreakfast;
  List<Aliments?>? listAlimentsLunch;
  double? caloriesConsumedLunch;
  List<Aliments?>? listAlimentsDinner;
  double? caloriesConsumedDinner;
  double? caloriesAjoute;
  String name;
  Breakfast? screenBreakfast;
  Lunch? screenLunch;
  Dinner? screenDinner;
  double? calories;
  double? lastCalories;
  meal({
    Key? key,
    this.lastCalories,
    List<Aliments?>? listAliments,
    required this.calories,
    required this.screenBreakfast,
    required this.screenLunch,
    required this.screenDinner,
    required this.listeMeal,
    required this.name,
    required this.caloriesAjoute,
    required this.caloriesConsumedBreakfast,
    required this.caloriesConsumedDinner,
    required this.caloriesConsumedLunch,
    required this.listAlimentsBreakfast,
    required this.listAlimentsDinner,
    required this.listAlimentsLunch,
  }) : super(key: key) {
    listAlimentsMeal = listAliments ?? [];
  }

  @override
  State<meal> createState() => _mealState();
}

class _mealState extends State<meal> {
  String? name;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/back.png"), fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            color: const Color(0xff1d1e1c),
                            borderRadius: BorderRadius.circular(50)),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              if ((name!.isNotEmpty) || (name != null)) {
                                widget.listeMeal!.add(MealWidget(
                                  name: name,
                                  calories: widget.lastCalories,
                                ));
                              }
                              if (widget.name == "Breakfast") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Breakfast(
                                            screenDinner: widget.screenDinner,
                                            screenLunch: widget.screenLunch,
                                            listeMeal: widget.listeMeal,
                                            caloriesAjoute:
                                                widget.caloriesAjoute,
                                            caloriesConsumedBreakfast: widget
                                                .caloriesConsumedBreakfast,
                                            caloriesConsumedDinner:
                                                widget.caloriesConsumedDinner,
                                            caloriesConsumedLunch:
                                                widget.caloriesConsumedLunch,
                                            listAliments:
                                                widget.listAlimentsBreakfast,
                                            listAlimentsDinner:
                                                widget.listAlimentsDinner,
                                            listAlimentsLunch:
                                                widget.listAlimentsLunch,
                                          )),
                                );
                              } else if (widget.name == "Lunch") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Lunch(
                                            screenBreakfast:
                                                widget.screenBreakfast,
                                            screenDinner: widget.screenDinner,
                                            listeMeal: widget.listeMeal,
                                            caloriesAjoute:
                                                widget.caloriesAjoute,
                                            caloriesConsumedBreakfast: widget
                                                .caloriesConsumedBreakfast,
                                            caloriesConsumedDinner:
                                                widget.caloriesConsumedDinner,
                                            caloriesConsumedLunch:
                                                widget.caloriesConsumedLunch,
                                            listAliments:
                                                widget.listAlimentsLunch,
                                            listAlimentsDinner:
                                                widget.listAlimentsDinner,
                                            listAlimentsBreakfast:
                                                widget.listAlimentsBreakfast,
                                          )),
                                );
                              } else if (widget.name == "Dinner") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dinner(
                                            screenLunch: widget.screenLunch,
                                            screenBreakfast:
                                                widget.screenBreakfast,
                                            listeMeal: widget.listeMeal,
                                            caloriesAjoute:
                                                widget.caloriesAjoute,
                                            caloriesConsumedBreakfast: widget
                                                .caloriesConsumedBreakfast,
                                            caloriesConsumedDinner:
                                                widget.caloriesConsumedDinner,
                                            caloriesConsumedLunch:
                                                widget.caloriesConsumedLunch,
                                            listAliments:
                                                widget.listAlimentsDinner,
                                            listAlimentsBreakfast:
                                                widget.listAlimentsBreakfast,
                                            listAlimentsLunch:
                                                widget.listAlimentsLunch,
                                          )),
                                );
                              }
                            },
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Text(
                        'Create meal',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          letterSpacing: 2,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      padding: const EdgeInsets.only(left: 20.0),
                      decoration: BoxDecoration(
                          color: const Color(0xff312E2E),
                          borderRadius: BorderRadius.circular(8)),
                      width: 350,
                      height: 61,
                      child: Row(
                        children: [
                          const Text(
                            ' Name',
                            style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 21,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  child: TextField(
                                    onChanged: (value) {
                                      name = value;
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: '    New  food  name',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    padding: const EdgeInsets.only(top: 13, left: 30),
                    decoration: BoxDecoration(
                        color: const Color(0xff312E2E),
                        borderRadius: BorderRadius.circular(8)),
                    width: 350,
                    height: 103,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ingredients',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 1,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Center(
                          child: SizedBox(
                            width: 311,
                            child: Divider(
                              thickness: 1,
                              color: Color(0x33ffffff),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              'Add igredient',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: 1,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              width: 140,
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchMeal(
                                            listAlimentsMeal:
                                                widget.listAlimentsMeal,
                                            listeMeal: widget.listeMeal,
                                            calories: widget.calories,
                                            screenBreakfast:
                                                widget.screenBreakfast,
                                            screenDinner: widget.screenDinner,
                                            screenLunch: widget.screenLunch,
                                            name: widget.name,
                                            caloriesAjoute:
                                                widget.caloriesAjoute,
                                            caloriesConsumedBreakfast: widget
                                                .caloriesConsumedBreakfast,
                                            caloriesConsumedDinner:
                                                widget.caloriesConsumedDinner,
                                            caloriesConsumedLunch:
                                                widget.caloriesConsumedLunch,
                                            listAlimentsBreakfast:
                                                widget.listAlimentsBreakfast,
                                            listAlimentsDinner:
                                                widget.listAlimentsDinner,
                                            listAlimentsLunch:
                                                widget.listAlimentsLunch,
                                          )),
                                );
                              },
                              color: const Color(0xffffffff),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                      itemCount: widget.listAlimentsMeal!.length,
                      itemBuilder: (context, index) {
                        Aliments? model = widget.listAlimentsMeal![index];
                        return AlimentsInfoWidget(model: model!);
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
