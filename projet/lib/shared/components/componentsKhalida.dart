import 'package:flutter/material.dart';

Widget defaultButton(
        {double width = double.infinity,
        double hight = 32,
        Color background = const Color(0xffd0fd3e),
        Color textColor = Colors.black,
        required double size,
        required Function right,
        required String text,
        bool isapper = true,
        double rad = 0}) =>
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(rad),
          color: background),
      width: width,
      height: hight,
      child: MaterialButton(
          onPressed: right(),
          child: Text(text,
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontFamily: "WorkSans",
                  fontStyle: FontStyle.normal,
                  fontSize: size),
              textAlign: TextAlign.center)),
    );
Widget Field({
  Color textColor = Colors.black,
  double width = 370.5,
  double hight = 52.9,
  double rad = 25,
  required String text,
  required keyboardType,
  //required bool,
}) =>
    Container(
      width: width,
      height: hight,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(rad)),
      child: TextFormField(
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: text,
            hintStyle: const TextStyle(color: Colors.black)),
        keyboardType: keyboardType,
        //obscureText: bool,
      ),
    );

/*Widget TextField({
  Color textColor = Colors.black,
  double width = 370.5,
  double hight = 52.9,
  double rad = 25,
  required keyboardType,
  required String text,
  required bool,
}) =>
    Container(
      width: width,
      height: hight,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(rad)),
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: text,
            hintStyle: TextStyle(color: Colors.black)),
        keyboardType: keyboardType,
        obscureText: bool,
      ),
    );*/
