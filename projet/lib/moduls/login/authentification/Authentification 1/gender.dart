import 'package:fitness/moduls/login/sign%20up/secreen_signup.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

import '../../../../shared/components/components.dart';
import '../Authentification2/weight.dart';

class Authentification1 extends StatefulWidget {
  @override
  State<Authentification1> createState() => _Authentification1State();
  const Authentification1(
      {required this.email, required this.pasword, required this.username});
  final String email;
  final String pasword;
  final String username;
}

bool ismale = false;

int _currentValue = 24;
double _activityLevel = 1; // default value

String getActivityLevelString(double value) {
  if (value == 0.0) {
    return 'Low activity';
  } else if (value < 1.0) {
    return 'Moderate activity';
  } else if (value < 2.0) {
    return 'High activity';
  } else if (value <= 3.0) {
    return 'Very high activity';
  } else {
    return 'null';
  }
}

final _items = [
  Colors.blue,
  Colors.orange,
  Colors.green,
  Colors.pink,
  Colors.red,
  Colors.amber,
  Colors.brown,
  Colors.yellow,
  Colors.blue,
];
final _pageController = PageController();
final _currentPageNotifier = ValueNotifier<int>(0);
const _boxHeight = 150.0;
_buildCircleIndicator3() {
  return CirclePageIndicator(
    selectedDotColor: Colors.green,
    itemCount: 3,
    currentPageNotifier: _currentPageNotifier,
  );
}

String _activityLevelString = getActivityLevelString(_activityLevel);

class _Authentification1State extends State<Authentification1> {
  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
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
                text: "What is your gender ?",
                size: 15,
                weight: FontWeight.w700,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 24),
                    child: defaultButton(
                      size: 12,
                      right: () {
                        setState(() {
                          ismale = true;
                        });
                      },
                      text: 'MALE',
                      hight: 40,
                      width: 111,
                      rad: 25,
                      background: ismale
                          ? const Color(0xffd0fd3e)
                          : const Color(0xff828284),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  defaultButton(
                    size: 12,
                    right: () {
                      setState(() {
                        ismale = false;
                      });
                    },
                    text: 'FEMALE',
                    hight: 40,
                    width: 111,
                    rad: 25,
                    background: ismale
                        ? const Color(0xff828284)
                        : const Color(0xffd0fd3e),
                  ),
                ],
              ),
              const SizedBox(
                height: 54,
              ),
              defaultText(
                text: "How old are you ?",
                size: 15,
                weight: FontWeight.w700,
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: NumberPicker(
                  textStyle: const TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white38,
                    fontWeight: FontWeight.w600,
                    fontFamily: "OpenSans",
                    fontStyle: FontStyle.normal,
                    fontSize: 25.0,
                  ),
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(
                            color: Color(0x99d0fd3e),
                          ),
                          bottom: BorderSide(
                            color: Color(0x99d0fd3e),
                          ))),
                  selectedTextStyle: const TextStyle(
                      decoration: TextDecoration.none,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w600,
                      fontFamily: "OpenSans",
                      fontStyle: FontStyle.normal,
                      fontSize: 26.0),
                  value: _currentValue,
                  minValue: 0,
                  maxValue: 100,
                  onChanged: (value) => setState(() => _currentValue = value),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              defaultText(
                text: "What is your activity level ?",
                size: 15,
                weight: FontWeight.w700,
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getActivityLevelString(_activityLevel),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        decoration: TextDecoration.none,
                        color: Color(0xffb6b6b6),
                        fontWeight: FontWeight.w700,
                        fontFamily: "OpenSans",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 2,
                    child: Material(
                      color: Colors.transparent,
                      child: Slider(
                        activeColor: const Color(0xffd0fd3e),
                        value: _activityLevel,
                        max: 3,
                        min: 0,
                        label: _activityLevelString,
                        onChanged: ((value) {
                          setState(() {
                            _activityLevel = value;
                          });
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildCircleIndicator3(),
                      const SizedBox(
                        width: 60,
                      ),
                      defaultButton(
                          size: 17,
                          right: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Authentification2(
                                    email: widget.email,
                                    pasword: widget.pasword,
                                    username: widget.username,
                                    age: _currentValue,
                                    ismale: ismale,
                                  ),
                                ));
                          },
                          text: 'Next',
                          rad: 48,
                          hight: 35,
                          width: 90)
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
