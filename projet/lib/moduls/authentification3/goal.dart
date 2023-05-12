import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class goal extends StatefulWidget {
  const goal({required this.weight, required this.height});

  final double weight;
  final int height;

  @override
  State<goal> createState() => _goalState();
}

class _goalState extends State<goal> {
  int _selectedButtonIndex = -1; // Initially, no button is selected

  final List<String> _buttonTexts = ['Lose Weight', 'Maintain Weight', 'Gain Weight'];

// String goal = _selectedButtonIndex >= 0 ? _buttonTexts[_selectedButtonIndex] : "";

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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  right: () {},
                  text: 'Next',
                  rad: 48,
                  hight: 35,
                  width: 90)
            ],
          )
        ]),
      ),
    );
  }
}
