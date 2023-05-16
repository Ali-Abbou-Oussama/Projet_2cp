// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

import '../../../../shared/components/components.dart';
import '../authentification3/goal.dart';

class Authentification2 extends StatefulWidget {
  const Authentification2({
    Key? key,
    required this.ismale,
    required this.age,
    required this.email,
    required this.pasword,
    required this.username,
    required this.activitylevel,
  }) : super(key: key);

  final String email;
  final String pasword;
  final String username;
  final String activitylevel;
  final bool ismale;
  final int age;

  @override
  State<Authentification2> createState() => _Authentification2State();
}

class _Authentification2State extends State<Authentification2> {
  late WeightSliderController _controller;
  double _weight = 30.0;

  @override
  void initState() {
    super.initState();
    _controller = WeightSliderController(
        initialWeight: _weight, minWeight: 0, interval: 0.1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int height = 175;
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  final _boxHeight = 150.0;
  _buildCircleIndicator3() {
    return CirclePageIndicator(
      selectedDotColor: Colors.green,
      itemCount: 3,
      currentPageNotifier: _currentPageNotifier,
    );
  }

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
                  text: "What is your weight ?",
                  size: 15,
                  weight: FontWeight.w700,
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    "${_weight.toStringAsFixed(1)} kg",
                    style: const TextStyle(
                        fontFamily: "OpenSans",
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: Transform.rotate(
                    angle: (-90 * 3.14) / 180,
                    child: VerticalWeightSlider(
                      controller: _controller,
                      decoration: const PointerDecoration(
                        width: 100.0,
                        height: 3.0,
                        largeColor: Color(0xffd0fd3e),
                        mediumColor: Color(0xffd0fd3e),
                        smallColor: Color(0xffd0fd3e),
                        gap: 30.0,
                      ),
                      onChanged: (double value) {
                        setState(() {
                          _weight = value;
                        });
                      },
                      indicator: Container(
                        height: 2.0,
                        width: 60.0,
                        alignment: Alignment.centerLeft,
                        color: const Color(0xffd0fd3e),
                      ),
                    ),
                  ),
                ),
                defaultText(
                  text: "What is your height ?",
                  size: 15,
                  weight: FontWeight.w700,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                        value: height,
                        minValue: 100,
                        maxValue: 200,
                        onChanged: (value) => setState(() => height = value),
                      ),
                    ),
                    // cm
                    const Text("cm",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                            fontFamily: "OpenSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0),
                        textAlign: TextAlign.center)
                  ],
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
                                builder: (context) => goal(
                                  age: widget.age,
                                  email: widget.email,
                                  pasword: widget.pasword,
                                  ismale: widget.ismale,
                                  username: widget.username,
                                  weight: _weight,
                                  height: height,
                                  activitylevel: widget.activitylevel,
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
          )),
    );
  }
}
