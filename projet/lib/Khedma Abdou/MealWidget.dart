// ignore_for_file: must_be_immutable, file_names, avoid_print, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MealWidget extends StatefulWidget {
  BuildContext? context;
  String? name;
  double? calories;
  MealWidget({Key? key, required this.name, required this.calories})
      : super(key: key);

  @override
  State<MealWidget> createState() => _MealWidgetState();
}

class _MealWidgetState extends State<MealWidget> {
  NumberFormat formatter = NumberFormat('000.00');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, top: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.name!,
            style: const TextStyle(
                color: Color(0xffffffff),
                fontWeight: FontWeight.w600,
                fontFamily: "OpenSans",
                fontStyle: FontStyle.normal,
                fontSize: 17.0),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '${widget.calories!.toInt()} Calories',
            style: const TextStyle(
                color: Color(0xffffffff),
                fontWeight: FontWeight.w600,
                fontFamily: "OpenSans",
                fontStyle: FontStyle.normal,
                fontSize: 17.0),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 15),
            child: Container(
              height: 1,
              width: double.infinity,
              color: const Color(0xff5a5858),
            ),
          )
        ],
      ),
    );
  }
}
