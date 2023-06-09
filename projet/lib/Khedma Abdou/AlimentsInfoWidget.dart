// ignore_for_file: must_be_immutable, file_names, avoid_print, depend_on_referenced_packages

import 'package:fitness/Khedma%20Abdou/Aliments.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AlimentsInfoWidget extends StatefulWidget {
  Aliments? model;
  List<Aliments?>? listAliments;
  BuildContext? context;
  double? caloriesAlreadyConsumed;
  AlimentsInfoWidget(
      {Key? key,
      this.model,
      this.listAliments,
      this.context,
      this.caloriesAlreadyConsumed})
      : super(key: key);

  @override
  State<AlimentsInfoWidget> createState() => _AlimentsInfoWidgetState();
}

class _AlimentsInfoWidgetState extends State<AlimentsInfoWidget> {
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
            widget.model!.name!,
            style: const TextStyle(
                color: Color(0xffffffff),
                fontWeight: FontWeight.w600,
                fontFamily: "OpenSans",
                fontStyle: FontStyle.normal,
                fontSize: 17.0),
          ),
          Text("${formatter.format(widget.model!.calories!)}  Cal/100g",
              style: const TextStyle(
                  color: Color(0x80ffffff),
                  fontWeight: FontWeight.w500,
                  fontFamily: "WorkSans",
                  fontStyle: FontStyle.normal,
                  fontSize: 12.0),
              textAlign: TextAlign.left),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 15,
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
