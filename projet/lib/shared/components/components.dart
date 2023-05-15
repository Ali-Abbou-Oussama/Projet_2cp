import 'dart:ffi';

import 'package:flutter/cupertino.dart';
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
          boxShadow: [
            BoxShadow(
                color: const Color(0x40000000),
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
    Container(
      width: width,
      height: hight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(rad),
      ),
      child: TextFormField(
        validator: validate,
        keyboardType: type,
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black, // Change border color here
              ),
              borderRadius: BorderRadius.circular(
                  25), // Match container border radius here
            ),
            labelText: text,
            hintStyle: TextStyle(
              color: textColor,
            )),
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
        textStyle: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.white38,
          fontWeight: FontWeight.w600,
          fontFamily: "OpenSans",
          fontStyle: FontStyle.normal,
          fontSize: 25.0,
        ),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                  color: Color(0x99d0fd3e),
                ),
                bottom: BorderSide(
                  color: Color(0x99d0fd3e),
                ))),
        selectedTextStyle: TextStyle(
            decoration: TextDecoration.none,
            color: const Color(0xffffffff),
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
