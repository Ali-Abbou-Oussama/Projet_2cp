// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:numberpicker/numberpicker.dart';

int _currentValue = 24;
Widget defaultButton(
        {String family = "WorkSans",
        double width = double.infinity,
        double hight = 32,
        Color background = const Color(0xffd0fd3e),
        Color textColor = Colors.black,
        required double size,
        VoidCallback? right,
        required String text,
        bool isapper = true,
        double rad = 0}) =>
    Container(
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Color(0x40000000),
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0)
          ],
          borderRadius: BorderRadiusDirectional.circular(rad),
          color: background),
      width: width,
      height: hight,
      child: MaterialButton(
          onPressed: right,
          child: // Login
              Text(text,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: family,
                      fontStyle: FontStyle.normal,
                      fontSize: size),
                  textAlign: TextAlign.center)),
    );
Widget Field({
  required TextEditingController controller,
  required TextInputType type,
  Color textColor = Colors.black,
  double width = 370.5,
  double hight = 52.9,
  double rad = 25,
  required String text,
  required String? Function(String?)? validate,
}) =>
    Padding(
      padding: const EdgeInsets.all(0),
      child: TextFormField(
        validator: validate,
        keyboardType: type,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black, // Change border color here
            ),
            borderRadius:
                BorderRadius.circular(25), // Match container border radius here
          ),
          labelText: text,
          hintStyle: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );

Widget defaultText({
  FontWeight weight = FontWeight.w400,
  required String text,
  Color colortext = Colors.white,
  double size = 15,
  String family = "WorkSans",
  FontStyle style = FontStyle.normal,
}) =>
    Text(text,
        style: TextStyle(
          color: colortext,
          fontWeight: weight,
          fontFamily: family,
          fontStyle: style,
          fontSize: size,
          decoration: TextDecoration.none,
        ),
        textAlign: TextAlign.center);
Widget vertslider({
  required Function changed,
  required int min,
  required int max,
}) =>
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
        minValue: min,
        maxValue: max,
        onChanged: changed(),
      ),
    );

void showToast({
  required String text,
  required ToasStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16,
    );

enum ToasStates { SUCCESS, EROOR, WARNING }

Color chooseToastColor(ToasStates state) {
  Color color;
  switch (state) {
    case ToasStates.SUCCESS:
      color = Colors.green;
      break;
    case ToasStates.EROOR:
      color = Colors.red;
      break;
    case ToasStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

class CustomContainer extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomContainer({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 340,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 49, 46, 46),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 20, 20, 20).withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 17, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 19.245473861694336,
                fontFamily: 'WorkSans',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              subtitle,
              style: const TextStyle(
                color: Color(0xff929292),
                fontSize: 10,
                fontFamily: 'WorkSans',
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomImageCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const CustomImageCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 20, 20, 20).withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              width: 230,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.asset(
                  imagePath,
                  width: 230,
                  height: 111,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 230,
              height: 50,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 49, 46, 46),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(9),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13.5,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xff929292),
                        fontSize: 8.5,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomImageCard2 extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const CustomImageCard2({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        child: Column(
          children: [
            SizedBox(
              width: 230,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.asset(
                  imagePath,
                  width: 230,
                  height: 230,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 230,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(9),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13.5,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xff929292),
                        fontSize: 8.5,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
