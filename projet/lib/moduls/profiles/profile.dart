import 'package:fitness/moduls/profiles/cpasswd.dart';
import 'package:fitness/moduls/profiles/personaldetails.dart';
import 'package:fitness/shared/cubit/cubit.dart';
import 'package:fitness/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:math' as math;
import '../../shared/components/Dialogs/goalw.dart';
import '../../shared/components/components.dart';

class profilescreen extends StatefulWidget {
  const profilescreen({Key? key}) : super(key: key);

  @override
  State<profilescreen> createState() => _profilescreenState();
}

double bmi(
    bool ismale, int? height, double? weight, int? age, String? activitylevel) {
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

String goal(int index) {
  if (index == 0) {
    return 'Lose Weight';
  } else if (index == 1) {
    return 'Maintain Weight';
  } else if (index == 2) {
    return 'Gain Weight';
  }
  return '';
}

bool isMale(String? gender) {
  if (gender == 'Male') {
    return true;
  } else {
    return false;
  }
}

class _profilescreenState extends State<profilescreen> {
  int _selectedIndex = -1;
  final String _name = 'Full Name';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getFitCubit()..getUserData(),
      child: BlocConsumer<getFitCubit, getFitStates>(
        listener: (context, state) {},
        builder: (context, state) {
          int select(String? goal) {
            if (goal == 'Lose Weight') {
              return 0;
            } else if (goal == 'Maintain Weight') {
              return 1;
            } else {
              return 2;
            }
          }

          String selectA(int select) {
            if (select == 0) {
              return 'Lose Weight';
            } else if (select == 1) {
              return 'Maintain Weight';
            } else if (select == 2) {
              return 'Gain Weight';
            }
            return '';
          }

          _selectedIndex = select(getFitCubit.get(context).goal);

          return Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/Splash.png"), fit: BoxFit.cover)),
            child: Column(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 17, top: 10),
                      child: Text(
                        ' GetFit',
                        style: TextStyle(
                          color: Color.fromARGB(255, 205, 231, 134),
                          fontSize: 25,
                          fontFamily: 'Inter-Bold',
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                        padding: const EdgeInsets.only(right: 17, top: 10),
                        child: Transform.rotate(
                          angle: -45 * math.pi / 180,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications_outlined,
                            ),
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 140,
                        height: 140,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("images/Pfpic.png")),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 208, 253, 62),
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    _name,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
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
                            builder: (context) => GoalDialog(
                              selectedindex: _selectedIndex,
                            ),
                          );
                          if (result != null) {
                            setState(() {
                              getFitCubit.get(context).updateGoal(
                                  Goal: selectA(result),
                                  calori: calories(
                                    bmi(
                                      isMale(getFitCubit.get(context).gender),
                                      getFitCubit.get(context).height,
                                      getFitCubit.get(context).weight,
                                      getFitCubit.get(context).age,
                                      getFitCubit.get(context).activityLevel,
                                    ),
                                    goal(result),
                                  ));

                              _selectedIndex = result;
                            });
                          }
                        },
                        child: const CustomContainer(
                          title: 'MyGoal',
                          subtitle: 'Change your goal',
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => pdetails(
                                  mygoal: select(
                                      getFitCubit.get(context).model!.goal),
                                ),
                              ));
                        },
                        child: const CustomContainer(
                          title: 'Personal Details',
                          subtitle: 'Change your height, weight...',
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const pswd(),
                              ));
                        },
                        child: const CustomContainer(
                          title: 'Password',
                          subtitle: 'Change your password',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
