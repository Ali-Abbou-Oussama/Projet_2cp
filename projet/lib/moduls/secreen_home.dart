// ignore_for_file: camel_case_types, non_constant_identifier_names, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/Khedma%20Abdou/Aliments.dart';
import 'package:fitness/moduls/Breakfast.dart';
import 'package:fitness/moduls/Dinner.dart';
import 'package:fitness/moduls/Lunch.dart';
import 'package:fitness/shared/cubit/cubit.dart';
import 'package:fitness/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class homeview extends StatefulWidget {
  late List<Aliments?>? listAlimentsBreakfast;
  late double? caloriesConsumedBreakfast;
  late List<Aliments?>? listAlimentsLunch;
  late double? caloriesConsumedLunch;
  late List<Aliments?>? listAlimentsDinner;
  late double? caloriesConsumedDinner;
  late Breakfast? screenBreakfast;
  late Dinner? screenDinner;
  late Lunch? screenLunch;
  homeview(
      {Key? key,
      this.screenDinner,
      this.screenLunch,
      this.caloriesConsumedBreakfast = 0,
      this.caloriesConsumedDinner = 0,
      this.caloriesConsumedLunch = 0,
      this.listAlimentsBreakfast,
      this.screenBreakfast,
      this.listAlimentsDinner,
      this.listAlimentsLunch})
      : super(key: key);

  @override
  State<homeview> createState() => _homeviewState();
}

class _homeviewState extends State<homeview> {
  var currentuid = FirebaseAuth.instance.currentUser!.uid;
  // var user = FirebaseFirestore.instance
  //     .collection('users')
  //     .where('uid', isEqualTo: currentuid)
  //     .get();
  int? breakFastCalories;
  int DinnerCalories = 0;

  int LunchCalories = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getFitCubit()..getUserData(),
      child: BlocConsumer<getFitCubit, getFitStates>(
        listener: (context, state) {},
        builder: (context, state) {
          int remaining = getFitCubit.get(context).remaining;
          int? eaten = getFitCubit.get(context).calories - remaining;
          double porcentage =
              (remaining * 100) / getFitCubit.get(context).calories;
          print(porcentage);

          //  remaining = calories!;
          // double pourcentage = (remaining * 100 / calories);

          return Scaffold(
              body: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/back.png"),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        const Text(
                          'GetFit',
                          style: TextStyle(
                            color: Color(0xffc3d292),
                            fontSize: 25,
                            letterSpacing: 4,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          width: 190,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_outlined,
                          ),
                        )
                      ]),
                      const SizedBox(height: 35),
                      Row(
                        children: [
                          const SizedBox(
                            width: 17,
                          ),
                          Stack(
                            children: [
                              const SizedBox(width: 22),
                              const Positioned(
                                top: 18,
                                left: 30,
                                child: Text(
                                  'Remaining',
                                  style: TextStyle(
                                    letterSpacing: 2,
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ),
                              SimpleCircularProgressBar(
                                valueNotifier: ValueNotifier(90),
                                mergeMode: false,
                                size: 155,
                                animationDuration: 3,
                                onGetText: (double value) {
                                  return remaining >= 0
                                      ? Text(
                                          '$remaining',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      : const Text(
                                          '0',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        );
                                },
                                progressStrokeWidth: 5,
                                backStrokeWidth: 5,
                                progressColors: const [
                                  Color(0xffd0fd3e),
                                  Color(0xffff2424)
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(width: 22),
                          Stack(
                            children: [
                              const Positioned(
                                top: 15,
                                left: 26,
                                child: Text(
                                  'Eaten',
                                  style: TextStyle(
                                    letterSpacing: 2,
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ),
                              SimpleCircularProgressBar(
                                valueNotifier: ValueNotifier(10),
                                mergeMode: false,
                                animationDuration: 3,
                                onGetText: (double value) {
                                  return Text(
                                    eaten.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                },
                                progressStrokeWidth: 5,
                                backStrokeWidth: 5,
                                progressColors: const [
                                  Color(0xffd0fd3e),
                                  Color(0xffff2424)
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Stack(
                            children: [
                              const SizedBox(width: 22),
                              const Positioned(
                                top: 13,
                                left: 40,
                                child: Text(
                                  'Fat',
                                  style: TextStyle(
                                    letterSpacing: 2,
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ),
                              SimpleCircularProgressBar(
                                valueNotifier: ValueNotifier(25),
                                mergeMode: false,
                                animationDuration: 3,
                                onGetText: (double value) {
                                  return Text(
                                    '${value.toInt()}%',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                },
                                progressStrokeWidth: 5,
                                backStrokeWidth: 5,
                                progressColors: const [Color(0xffd0fd3e)],
                              ),
                            ],
                          ),
                          const SizedBox(width: 19),
                          Stack(
                            children: [
                              const Positioned(
                                top: 9,
                                left: 22,
                                child: Text(
                                  'Protein',
                                  style: TextStyle(
                                    letterSpacing: 2,
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ),
                              SimpleCircularProgressBar(
                                valueNotifier: ValueNotifier(45),
                                mergeMode: false,
                                animationDuration: 3,
                                onGetText: (double value) {
                                  return Text(
                                    '${value.toInt()}%',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                },
                                progressStrokeWidth: 5,
                                backStrokeWidth: 5,
                                progressColors: const [Color(0xffff2424)],
                              ),
                            ],
                          ),
                          const SizedBox(width: 19),
                          Stack(
                            children: [
                              const Positioned(
                                top: 9,
                                left: 25,
                                child: Text(
                                  'Carbs',
                                  style: TextStyle(
                                    letterSpacing: 2,
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ),
                              SimpleCircularProgressBar(
                                valueNotifier: ValueNotifier(30),
                                mergeMode: false,
                                animationDuration: 3,
                                onGetText: (double value) {
                                  return Text(
                                    '${value.toInt()}%',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                },
                                progressStrokeWidth: 5,
                                backStrokeWidth: 5,
                                progressColors: const [Color(0xffe79332)],
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (widget.screenBreakfast == null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Breakfast(
                                              screenLunch: widget.screenLunch,
                                              screenDinner: widget.screenDinner,
                                              caloriesConsumedBreakfast: widget
                                                  .caloriesConsumedBreakfast,
                                              listAliments:
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
                              } else {
                                widget.screenLunch ??= Lunch(
                                    screenBreakfast: widget.screenBreakfast,
                                    screenDinner: widget.screenDinner);
                                widget.screenDinner ??= Dinner(
                                    screenLunch: widget.screenLunch,
                                    screenBreakfast: widget.screenBreakfast);
                                widget.screenBreakfast!.screenDinner =
                                    widget.screenDinner!;
                                widget.screenBreakfast!.screenLunch =
                                    widget.screenLunch!;
                                widget.screenBreakfast!
                                        .caloriesConsumedBreakfast =
                                    widget.caloriesConsumedBreakfast;
                                widget.screenBreakfast!.caloriesConsumedDinner =
                                    widget.caloriesConsumedDinner;
                                widget.screenBreakfast!.caloriesConsumedLunch =
                                    widget.caloriesConsumedLunch;
                                widget.screenBreakfast!.caloriesAjoute = 0;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            widget.screenBreakfast!));
                              }
                            },
                            child: const ListTile(
                              title: Text(
                                'Breakfast',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19.245473861694336,
                                  fontFamily: 'WorkSans',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(
                                'Recommended 400 cal',
                                style: TextStyle(
                                    color: Color(0xff929292),
                                    fontSize: 10,
                                    fontFamily: 'WorkSans',
                                    fontWeight: FontWeight.w700),
                              ),
                              trailing: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (widget.screenLunch == null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Lunch(
                                              screenBreakfast:
                                                  widget.screenBreakfast,
                                              screenDinner: widget.screenDinner,
                                              caloriesConsumedLunch:
                                                  widget.caloriesConsumedLunch,
                                              listAliments:
                                                  widget.listAlimentsLunch,
                                              caloriesConsumedBreakfast: widget
                                                  .caloriesConsumedBreakfast,
                                              caloriesConsumedDinner:
                                                  widget.caloriesConsumedDinner,
                                              listAlimentsBreakfast:
                                                  widget.listAlimentsBreakfast,
                                              listAlimentsDinner:
                                                  widget.listAlimentsDinner,
                                            )));
                              } else {
                                widget.screenBreakfast ??= Breakfast(
                                    screenLunch: widget.screenLunch,
                                    screenDinner: widget.screenDinner);
                                widget.screenDinner ??= Dinner(
                                    screenLunch: widget.screenLunch,
                                    screenBreakfast: widget.screenBreakfast);
                                widget.screenLunch!.screenDinner =
                                    widget.screenDinner!;
                                widget.screenLunch!.screenBreakfast =
                                    widget.screenBreakfast!;
                                widget.screenLunch!.caloriesConsumedBreakfast =
                                    widget.caloriesConsumedBreakfast;
                                widget.screenLunch!.caloriesConsumedDinner =
                                    widget.caloriesConsumedDinner;
                                widget.screenLunch!.caloriesConsumedLunch =
                                    widget.caloriesConsumedLunch;
                                widget.screenLunch!.caloriesAjoute = 0;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            widget.screenLunch!));
                              }
                            },
                            child: const ListTile(
                              title: Text(
                                'Lunch',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19.245473861694336,
                                  fontFamily: 'WorkSans',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(
                                'Recommended 592 cal',
                                style: TextStyle(
                                    color: Color(0xff929292),
                                    fontSize: 10,
                                    fontFamily: 'WorkSans',
                                    fontWeight: FontWeight.w700),
                              ),
                              trailing: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (widget.screenDinner == null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Dinner(
                                              screenLunch: widget.screenLunch,
                                              screenBreakfast:
                                                  widget.screenBreakfast,
                                              caloriesConsumedDinner:
                                                  widget.caloriesConsumedDinner,
                                              listAliments:
                                                  widget.listAlimentsDinner,
                                              caloriesConsumedBreakfast: widget
                                                  .caloriesConsumedBreakfast,
                                              caloriesConsumedLunch:
                                                  widget.caloriesConsumedLunch,
                                              listAlimentsBreakfast:
                                                  widget.listAlimentsBreakfast,
                                              listAlimentsLunch:
                                                  widget.listAlimentsLunch,
                                            )));
                              } else {
                                widget.screenLunch ??= Lunch(
                                    screenBreakfast: widget.screenBreakfast,
                                    screenDinner: widget.screenDinner);
                                widget.screenBreakfast ??= Breakfast(
                                    screenLunch: widget.screenLunch,
                                    screenDinner: widget.screenDinner);
                                widget.screenDinner!.screenBreakfast =
                                    widget.screenBreakfast!;
                                widget.screenDinner!.screenLunch =
                                    widget.screenLunch!;
                                widget.screenDinner!.caloriesConsumedBreakfast =
                                    widget.caloriesConsumedBreakfast;
                                widget.screenDinner!.caloriesConsumedDinner =
                                    widget.caloriesConsumedDinner;
                                widget.screenDinner!.caloriesConsumedLunch =
                                    widget.caloriesConsumedLunch;
                                widget.screenDinner!.caloriesAjoute = 0;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            widget.screenDinner!));
                              }
                            },
                            child: const ListTile(
                              title: Text(
                                'Dinner',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19.245473861694336,
                                  fontFamily: 'WorkSans',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(
                                'Recommended 423 cal',
                                style: TextStyle(
                                    color: Color(0xff929292),
                                    fontSize: 10,
                                    fontFamily: 'WorkSans',
                                    fontWeight: FontWeight.w700),
                              ),
                              trailing: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          )
                        ],
                      ),
                    ]),
                  )),
              floatingActionButton: FloatingActionButton(
                backgroundColor: const Color(0xffc3d292),
                onPressed: () {},
                child: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 40,
                ),
              ));
        },
      ),
    );
  }
}
