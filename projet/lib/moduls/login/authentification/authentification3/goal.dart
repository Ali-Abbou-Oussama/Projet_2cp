// ignore_for_file: camel_case_types

import 'package:fitness/moduls/login/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/components/components.dart';
import '../../sign up/cubit/cubit.dart';
import '../../sign up/cubit/states.dart';

class goal extends StatefulWidget {
  const goal({
    Key? key,
    required this.weight,
    required this.height,
    required this.age,
    required this.email,
    required this.ismale,
    required this.pasword,
    required this.username,
    required this.activitylevel,
  }) : super(key: key);

  final String email;
  final String pasword;
  final String username;
  final int age;
  final bool ismale;
  final String activitylevel;

  final double weight;
  final int height;

  @override
  State<goal> createState() => _goalState();
}

class _goalState extends State<goal> {
  int _selectedButtonIndex = -1; // Initially, no button is selected

  final List<String> _buttonTexts = [
    'Lose Weight',
    'Maintain Weight',
    'Gain Weight'
  ];
  String goal(int index) {
    if (index == 0) {
      return 'Lose Weight';
    } else if (index == 1) {
      return 'Maintain Weight';
    } else if (index == 2) {
      return ' Gain Weight';
    }
    return '';
  }

  double bmi(
      bool ismale, int height, double weight, int age, String activitylevel) {
    double tmb;
    if (ismale) {
      tmb = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else {
      tmb = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
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

  int calories(double bmi, String goal) {
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, GetfitRegisterStates>(
        listener: (context, state) {},
        builder: ((context, state) {
          return Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/Splash.png"), fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 48,
                top: 50,
                end: 48,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    defaultText(
                        text:
                            'This enables us to create a personalized plan tailored specifically to you',
                        family: "Inter",
                        size: 19.0,
                        weight: FontWeight.w600),
                    const SizedBox(
                      height: 61,
                    ),
                    defaultText(
                      text: "What is your goal ?",
                      size: 15,
                      weight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 96,
                    ),
                    for (int i = 0; i < _buttonTexts.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Center(
                          child: defaultButton(
                            background: _selectedButtonIndex == i
                                ? const Color(0xffd0fd3e)
                                : const Color.fromARGB(255, 104, 101, 101),
                            family: "Inter",
                            size: 20,
                            text: _buttonTexts[i],
                            hight: 55,
                            rad: 4,
                            width: 225,
                            right: () {
                              setState(() {
                                _selectedButtonIndex = i;
                              });
                            },
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 200,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(
                          width: 60,
                        ),
                        defaultButton(
                            size: 17,
                            right: () {
                              RegisterCubit.get(context).userRegister(
                                  activitylevel: widget.activitylevel,
                                  calories: calories(
                                      bmi(
                                          widget.ismale,
                                          widget.height,
                                          widget.weight,
                                          widget.age,
                                          widget.activitylevel),
                                      goal(_selectedButtonIndex)),
                                  height: widget.height,
                                  eaten: 0,
                                  remaining: calories(
                                      bmi(
                                          widget.ismale,
                                          widget.height,
                                          widget.weight,
                                          widget.age,
                                          widget.activitylevel),
                                      goal(_selectedButtonIndex)),
                                  gender: widget.ismale ? 'Male' : 'FEMALE',
                                  username: widget.username,
                                  email: widget.email,
                                  password: widget.pasword,
                                  age: widget.age,
                                  goal: goal(_selectedButtonIndex),
                                  weight: widget.weight);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const loginView1()));
                            },
                            text: 'Next',
                            rad: 48,
                            hight: 35,
                            width: 90)
                      ],
                    )
                  ]),
            ),
          );
        }),
      ),
    );
  }
}
