// ignore_for_file: must_be_immutable, file_names, avoid_print, depend_on_referenced_packages

import 'package:fitness/Khedma%20Abdou/Aliments.dart';
import 'package:fitness/moduls/Dinner.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../moduls/Breakfast.dart';
import '../moduls/Lunch.dart';
import 'MealWidget.dart';

class AlimentsDesignWidgetDinner extends StatefulWidget {
  Aliments? model;
  List<Aliments?>? listAliments;
  BuildContext? context;
  double? caloriesAlreadyConsumed;
  late List<Aliments?>? listAlimentsLunch;
  late double? caloriesConsumedLunch;
  late List<Aliments?>? listAlimentsBreakfast;
  late double? caloriesConsumedBreakfast;
  double? caloriesAjoute;
  late Breakfast? screenBreakfast;
  late Lunch? screenLunch;
  List<MealWidget>? listeMeal;
  AlimentsDesignWidgetDinner(
      {Key? key,
      this.model,
      this.listAliments,
      this.context,
      this.caloriesAlreadyConsumed,
      this.caloriesConsumedBreakfast,
      this.caloriesConsumedLunch,
      this.listAlimentsBreakfast,
      this.listAlimentsLunch,
      this.caloriesAjoute,
      required this.listeMeal,
      required this.screenBreakfast,
      required this.screenLunch})
      : super(key: key);

  @override
  State<AlimentsDesignWidgetDinner> createState() =>
      _AlimentsDesignWidgetDinnerState();
}

class _AlimentsDesignWidgetDinnerState
    extends State<AlimentsDesignWidgetDinner> {
  NumberFormat formatter = NumberFormat('00.00');
  void _showBottomSheet() {
    double? gramsConsumed = 0.0;
    double? caloriesConsumed = 0.0;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: 431,
          decoration: const BoxDecoration(
              color: Color(0xff424040),
              image: DecorationImage(
                  image: AssetImage("images/back.png"), fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Food name :',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '  ${widget.model!.name!}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              const Row(children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Enter the number of grams consumed :',
                  style: TextStyle(color: Color(0xccffffff), fontSize: 16),
                ),
                SizedBox(
                  width: 15,
                )
              ]),
              const SizedBox(height: 25),
              TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  setState(() {
                    gramsConsumed = double.tryParse(value) ?? 0.0;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Grams',
                  hintStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xff6c6c6b),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      caloriesConsumed =
                          (gramsConsumed! * widget.model!.calories!) / 100;
                      widget.listAliments!.add(widget.model);
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Dinner(
                                  listeMeal: widget.listeMeal,
                                  screenBreakfast: widget.screenBreakfast,
                                  screenLunch: widget.screenLunch,
                                  caloriesAjoute: widget.caloriesAjoute! +
                                      caloriesConsumed!,
                                  listAliments: widget.listAliments,
                                  caloriesConsumedDinner: caloriesConsumed! +
                                      widget.caloriesAlreadyConsumed!,
                                  caloriesConsumedBreakfast:
                                      widget.caloriesConsumedBreakfast,
                                  caloriesConsumedLunch:
                                      widget.caloriesConsumedLunch,
                                  listAlimentsBreakfast:
                                      widget.listAlimentsBreakfast,
                                  listAlimentsLunch: widget.listAlimentsLunch,
                                )),
                      );
                    },
                    child: const Text(" Save",
                        style: TextStyle(
                            color: Color(0xffd0fd3e),
                            fontWeight: FontWeight.w500,
                            fontFamily: "WorkSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 17.0),
                        textAlign: TextAlign.left),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(" Cancel",
                        style: TextStyle(
                            color: Color(0xffd0fd3e),
                            fontWeight: FontWeight.w500,
                            fontFamily: "WorkSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 17.0),
                        textAlign: TextAlign.left),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showBottomSheet();
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 16, top: 15),
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
            Text("${widget.model!.calories!} Cal/100g",
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 7,
                  width: 5,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Protein',
                  style: TextStyle(
                    color: Color(0xfff04343),
                    fontSize: 10,
                    fontFamily: 'Castoro',
                  ),
                ),
                SizedBox(
                  width: 35,
                ),
                SizedBox(
                  height: 7,
                  width: 5,
                  child: CircleAvatar(
                    backgroundColor: Colors.amber,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Carbs',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 10,
                    fontFamily: 'Castoro',
                  ),
                ),
                SizedBox(
                  width: 35,
                ),
                SizedBox(
                  height: 7,
                  width: 5,
                  child: CircleAvatar(
                    backgroundColor: Color(0xffd6fd58),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Fat',
                  style: TextStyle(
                    color: Color(0xffd6fd58),
                    fontSize: 10,
                    fontFamily: 'Castoro',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  '${formatter.format(widget.model!.proteins!)} g',
                  style: const TextStyle(
                    color: Color(0xb2ffffff),
                    fontSize: 10,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 43,
                ),
                Text(
                  '${formatter.format(widget.model!.carbohydrates!)} g',
                  style: const TextStyle(
                    color: Color(0xb2ffffff),
                    fontSize: 10,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 43,
                ),
                Text(
                  '${formatter.format(widget.model!.lipids!)} g',
                  style: const TextStyle(
                    color: Color(0xb2ffffff),
                    fontSize: 10,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
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
      ),
    );
  }
}
