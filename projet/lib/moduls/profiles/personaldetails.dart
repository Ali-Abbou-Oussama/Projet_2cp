import 'package:fitness/shared/cubit/cubit.dart';
import 'package:fitness/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

import '../../shared/components/Dialogs/activityw.dart';
import '../../shared/components/Dialogs/agew.dart';
import '../../shared/components/components.dart';
import '../../shared/components/Dialogs/heightw.dart';
import '../../shared/components/Dialogs/weightw.dart';

class pdetails extends StatefulWidget {
  final int mygoal;
  const pdetails({Key? key, required this.mygoal}) : super(key: key);
  @override
  State<pdetails> createState() => _pdetailsState();
}

class _pdetailsState extends State<pdetails> {
  late WeightSliderController _controller;
  final double _initialWeight = 30.0;

  String getActivityLevelString(double value) {
    if (value == 0.0) {
      return 'Low activity';
    } else if (value == 1.0) {
      return 'Moderate activity';
    } else if (value == 2.0) {
      return 'High activity';
    } else {
      return 'Very high activity';
    }
  }

  double bmi(bool ismale, int? height, double? weight, int? age,
      String? activitylevel) {
    double tmb;
    if (ismale) {
      tmb = 88.362 + (13.397 * weight!) + (4.799 * height!) - (5.677 * age!);
    } else {
      tmb = 447.593 + (9.247 * weight!) + (3.098 * height!) - (4.330 * age!);
    }

    if (activitylevel == 'Low activity') {
      return tmb * 1.2;
    } else if (activitylevel == 'Moderate activity') {
      return tmb * 1.55;
    } else if (activitylevel == 'High activity') {
      return tmb * 1.725;
    } else if (activitylevel == 'Very high activity') {
      return tmb * 1.9;
    } else {
      return tmb * 1.55;
    }
  }

  int calories(double bmi, String? goal) {
    int n;
    if (goal == 'Lose Weight') {
      n = (bmi - 500).toInt();
    } else if (goal == 'Maintain Weight') {
      n = bmi.toInt();
    } else if (goal == 'Gain Weight') {
      n = (bmi + 500).toInt();
    } else {
      n = n = bmi.toInt();
    }
    return n;
  }

  bool isMale(String? gender) {
    if (gender == 'Male') {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = WeightSliderController(initialWeight: _initialWeight);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _activity = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getFitCubit()..getUserData(),
      child: BlocConsumer<getFitCubit, getFitStates>(
        listener: (context, state) {},
        builder: (context, state) {
          int? age = getFitCubit.get(context).age;
          double? initialWeight = getFitCubit.get(context).weight;
          int? height = getFitCubit.get(context).height;
          String? activitys = getFitCubit.get(context).activityLevel;
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/Splash.png"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 42,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 5, top: 10),
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                                color: const Color(0xff1d1e1c),
                                borderRadius: BorderRadius.circular(50)),
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        'Personal details',
                        style: TextStyle(
                          fontFamily: 'Work Sans Semibold',
                          fontWeight: FontWeight.normal,
                          fontSize: 25,
                          height: 1.5,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                        strutStyle: StrutStyle(
                          height: 1.5,
                          leading: 0.5,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 69,
                  ),
                  SizedBox(
                    height: 400,
                    width: 340,
                    child: ListView(
                      children: [
                        InkWell(
                          onTap: () async {
                            final result = await showDialog(
                              context: context,
                              builder: (context) {
                                return WeightDialog(
                                  controller: _controller,
                                  initialWeight: initialWeight,
                                );
                              },
                            );
                            if (result != null && result is double) {
                              setState(() {
                                getFitCubit.get(context).updateWeight(
                                    wight: result,
                                    calori: calories(
                                      bmi(
                                        isMale(getFitCubit
                                            .get(context)
                                            .model!
                                            .gender),
                                        getFitCubit.get(context).model!.height,
                                        getFitCubit.get(context).model!.weight,
                                        getFitCubit.get(context).model!.age,
                                        getFitCubit
                                            .get(context)
                                            .model!
                                            .activityLevel,
                                      ),
                                      getFitCubit.get(context).model!.goal,
                                    ));
                                // _initialWeight = result;
                                _controller = WeightSliderController(
                                    initialWeight: initialWeight);
                              });
                            }
                          },
                          child: CustomContainer(
                            title: 'Weight',
                            subtitle: 'Last set $initialWeight kg',
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () async {
                            final result = await showDialog(
                              context: context,
                              builder: (context) {
                                return HeightDialog(
                                  currentHeight: height!,
                                );
                              },
                            );
                            if (result != null) {
                              setState(() {
                                getFitCubit.get(context).updateHeight(
                                    height: result,
                                    calori: calories(
                                      bmi(
                                        isMale(getFitCubit.get(context).gender),
                                        getFitCubit.get(context).height,
                                        getFitCubit.get(context).weight,
                                        getFitCubit.get(context).age,
                                        getFitCubit.get(context).activityLevel,
                                      ),
                                      getFitCubit.get(context).model!.goal,
                                    ));

                                height = result;
                              });
                            }
                          },
                          child: CustomContainer(
                            title: 'Height',
                            subtitle: 'Last set $height Cm',
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () async {
                            final result = await showDialog(
                              context: context,
                              builder: (context) {
                                return AgeDialog(
                                  currentAge: age!,
                                );
                              },
                            );
                            if (result != null) {
                              setState(() {
                                getFitCubit.get(context).updateAge(
                                    age: result,
                                    calori: calories(
                                      bmi(
                                        isMale(getFitCubit.get(context).gender),
                                        getFitCubit.get(context).height,
                                        getFitCubit.get(context).weight,
                                        getFitCubit.get(context).age,
                                        getFitCubit.get(context).activityLevel,
                                      ),
                                      getFitCubit.get(context).model!.goal,
                                    ));

                                age = result;
                              });
                            }
                            print(widget.mygoal);
                          },
                          child: CustomContainer(
                            title: 'Your age',
                            subtitle: 'Last set $age years old',
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () async {
                            final result = await showDialog(
                              context: context,
                              builder: (context) {
                                return ActivityDialog(
                                  currentActivity: _activity,
                                );
                              },
                            );
                            if (result != null) {
                              setState(() {
                                getFitCubit.get(context).updateActivitylevel(
                                    activityLevel:
                                        getActivityLevelString(result),
                                    calori: calories(
                                      bmi(
                                        isMale(getFitCubit.get(context).gender),
                                        getFitCubit.get(context).height,
                                        getFitCubit.get(context).weight,
                                        getFitCubit.get(context).age,
                                        getFitCubit.get(context).activityLevel,
                                      ),
                                      getFitCubit.get(context).model!.goal,
                                    ));
                                _activity = result;
                                activitys = getActivityLevelString(_activity);
                              });
                            }
                            print(widget.mygoal);
                          },
                          child: CustomContainer(
                            title: 'Activity level',
                            subtitle: 'Last set $activitys ',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
