// ignore_for_file: file_names, must_be_immutable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/Khedma%20Abdou/Aliments.dart';
import 'package:fitness/Khedma%20Abdou/AlimentsInfoWidget.dart';
import 'package:fitness/Khedma%20Abdou/MealWidget.dart';
import 'package:fitness/Khedma%20Abdou/SearchScreenLunch.dart';
import 'package:fitness/layout/getfit_layout.dart';
import 'package:fitness/moduls/Breakfast.dart';
import 'package:fitness/moduls/Dinner.dart';
import 'package:fitness/moduls/meal.dart';
import 'package:fitness/shared/cubit/cubit.dart';
import 'package:fitness/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Lunch extends StatefulWidget {
  late List<MealWidget>? listeMeal;
  late List<Aliments?>? listAlimentsBreakfast;
  late double? caloriesConsumedBreakfast;
  late List<Aliments?>? listAlimentsLunch;
  late double? caloriesConsumedLunch;
  late List<Aliments?>? listAlimentsDinner;
  late double? caloriesConsumedDinner;
  double? caloriesAjoute;
  String name;
  late Breakfast? screenBreakfast;
  late Dinner? screenDinner;
  Lunch(
      {Key? key,
      this.caloriesConsumedLunch = 0.0,
      List<Aliments?>? listAliments,
      this.caloriesConsumedDinner,
      this.caloriesConsumedBreakfast,
      this.listAlimentsDinner,
      this.listAlimentsBreakfast,
      this.caloriesAjoute = 0.0,
      this.name = "Lunch",
      List<MealWidget>? listeMeal,
      required this.screenBreakfast,
      required this.screenDinner})
      : listAlimentsLunch = listAliments ?? [],
        listeMeal = listeMeal ?? [],
        super(key: key);

  @override
  State<Lunch> createState() => _LunchState();
}

class _LunchState extends State<Lunch> {
  bool _isVisible = false;
  bool _isTapped = false;
  Color _textColor1 = const Color(0xffD0FD3E);
  Color _underlineColor1 = const Color(0xffD0FD3E);
  Color _textColor2 = Colors.white;
  Color _underlineColor2 = Colors.white;

  void _onTap1() {
    setState(() {
      _textColor1 = const Color(0xffD0FD3E);
      _underlineColor1 = const Color(0xffD0FD3E);
      _textColor2 = Colors.white;
      _underlineColor2 = Colors.white;
      _isVisible = false;
    });
  }

  void _ontap2() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => SearchScreenLunch(
                listeMeal: widget.listeMeal,
                screenBreakfast: widget.screenBreakfast,
                screenDinner: widget.screenDinner,
                caloriesAjoute: widget.caloriesAjoute,
                caloriesAlreadyConsumed: widget.caloriesConsumedLunch,
                listAliments: widget.listAlimentsLunch,
                caloriesConsumedDinner: widget.caloriesConsumedDinner,
                caloriesConsumedBreakfast: widget.caloriesConsumedBreakfast,
                listAlimentsDinner: widget.listAlimentsDinner,
                listAlimentsBreakfast: widget.listAlimentsBreakfast,
              )),
    );
  }

  void _toggleVisibility() {
    setState(() {
      _textColor2 = const Color(0xffD0FD3E);
      _underlineColor2 = const Color(0xffD0FD3E);
      _textColor1 = Colors.white;
      _underlineColor1 = Colors.white;
      _isVisible = true;
    });
  }

  Future<QuerySnapshot>? postDocumentsList;
  String alimentText = '';

  initSearchingPost(textEntered) {
    postDocumentsList = FirebaseFirestore.instance
        .collection("Aliments")
        .where("name", isGreaterThanOrEqualTo: textEntered)
        .get();
    setState(() {
      postDocumentsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<getFitCubit, getFitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        int remaining = getFitCubit.get(context).calories;
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/back.png"), fit: BoxFit.cover)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                          color: const Color(0xff1d1e1c),
                          borderRadius: BorderRadius.circular(50)),
                      child: GestureDetector(
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xffffffff),
                          weight: 2,
                        ),
                        onTap: () {
                          getFitCubit.get(context).updateCalories(
                              calori:
                                  remaining - widget.caloriesAjoute!.toInt());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyWidget(
                                        screenLunch: widget,
                                        screenBreakfast: widget.screenBreakfast,
                                        screenDinner: widget.screenDinner,
                                        caloriesConsumedBreakfast:
                                            widget.caloriesConsumedBreakfast,
                                        listAlimentsBreakfast:
                                            widget.listAlimentsBreakfast,
                                        caloriesConsumedDinner:
                                            widget.caloriesConsumedDinner,
                                        caloriesConsumedLunch:
                                            widget.caloriesConsumedLunch,
                                        listAlimentsDinner:
                                            widget.listAlimentsDinner,
                                        listAlimentsLunch:
                                            widget.listAlimentsLunch,
                                      )));
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Text(
                      'Lunch',
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
              Text("calories consumed : ${widget.caloriesConsumedLunch}"),
              Container(
                padding: const EdgeInsets.only(left: 20),
                width: 355,
                child: TextField(
                  onTap: _ontap2,
                  decoration: InputDecoration(
                    hintText: 'Search for a food',
                    hintStyle: const TextStyle(
                        color: Color(0xff929292),
                        fontSize: 19,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w700),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Color(0xffc3d292),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              initSearchingPost(alimentText);
                            },
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color(0xff424040),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, top: 20),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: _onTap1,
                        child: Text(
                          'Recent',
                          style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 18,
                            decorationColor: _underlineColor1,
                            fontWeight: FontWeight.w500,
                            color: _textColor1,
                          ),
                        )),
                    const SizedBox(
                      width: 60,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                            onTap: _toggleVisibility,
                            child: Text(
                              'My food ',
                              style: TextStyle(
                                letterSpacing: 2,
                                fontSize: 18,
                                decorationColor: _underlineColor2,
                                fontWeight: FontWeight.w500,
                                color: _textColor2,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const Center(
                child: SizedBox(
                  width: 390,
                  child: Divider(
                    thickness: 1,
                    color: Color(0x33ffffff),
                  ),
                ),
              ),
              _isVisible
                  ? Flexible(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(height: 90),
                              const SizedBox(width: 30),
                              const Text(
                                'Meals ',
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(width: 120),
                              GestureDetector(
                                child: Text(
                                  'Create Meal +',
                                  style: TextStyle(
                                    color: _isTapped
                                        ? const Color(0xffD0FD3E)
                                        : Colors.white,
                                    letterSpacing: 2,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    _isTapped = true;
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => meal(
                                            lastCalories: 0,
                                            calories: 0,
                                            screenBreakfast:
                                                widget.screenBreakfast,
                                            screenDinner: widget.screenDinner,
                                            screenLunch: widget,
                                            listeMeal: widget.listeMeal,
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
                                                widget.listAlimentsLunch)),
                                  );
                                },
                              ),
                            ],
                          ),
                          widget.listeMeal != null ||
                                  widget.listeMeal!.isNotEmpty
                              ? Expanded(
                                  child: ListView.builder(
                                      itemCount: widget.listeMeal!.length,
                                      itemBuilder: (context, index) {
                                        MealWidget meal =
                                            widget.listeMeal![index];
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              widget.caloriesAjoute =
                                                  widget.caloriesAjoute! +
                                                      meal.calories!;
                                              widget.caloriesConsumedLunch =
                                                  widget.caloriesConsumedLunch! +
                                                      meal.calories!;
                                            });
                                          },
                                          child: MealWidget(
                                            name: meal.name,
                                            calories: meal.calories,
                                          ),
                                        );
                                      }),
                                )
                              : Container()
                        ],
                      ),
                    )
                  : widget.listAlimentsLunch == null ||
                          widget.listAlimentsLunch!.isEmpty
                      ? const Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              "Vous n'avez encore rien consommé",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          flex: 1,
                          child: ListView.builder(
                              itemCount: widget.listAlimentsLunch!.length,
                              itemBuilder: (context, index) {
                                Aliments? model =
                                    widget.listAlimentsLunch![index];
                                return AlimentsInfoWidget(model: model!);
                              }),
                        ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 70,
                margin: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffb5d05b),
                  border: Border.all(
                    color: const Color(0xff393737),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Calories consumed: ${widget.caloriesConsumedLunch}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Castoro',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              )
            ]),
          ),
        );
      },
    );
  }
}
