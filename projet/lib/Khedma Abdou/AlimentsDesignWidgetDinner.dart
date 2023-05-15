// ignore_for_file: must_be_immutable, file_names, avoid_print

import 'package:fitness/Khedma%20Abdou/Aliments.dart';
import 'package:fitness/moduls/Dinner.dart';
import 'package:flutter/material.dart';

class AlimentsDesignWidgetDinner extends StatefulWidget {
  Aliments? model;
  List<Aliments?>? listAliments;
  BuildContext? context;
  double? caloriesAlreadyConsumed;
  AlimentsDesignWidgetDinner(
      {Key? key,
      this.model,
      this.listAliments,
      this.context,
      this.caloriesAlreadyConsumed})
      : super(key: key);

  @override
  State<AlimentsDesignWidgetDinner> createState() =>
      _AlimentsDesignWidgetDinnerState();
}

class _AlimentsDesignWidgetDinnerState
    extends State<AlimentsDesignWidgetDinner> {
  void _showBottomSheet() {
    double? gramsConsumed = 0.0;
    double? caloriesConsumed = 0.0;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Food Details: ${widget.model!.name}'),
              const SizedBox(height: 16),
              const Text('Enter the number of grams consumed:'),
              const SizedBox(height: 8),
              TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  setState(() {
                    gramsConsumed = double.tryParse(value) ?? 0.0;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Grams',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  caloriesConsumed =
                      (gramsConsumed! * widget.model!.calories!) / 100;
                  widget.listAliments!.add(widget.model);
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Dinner(
                              listAliments: widget.listAliments,
                              caloriesConsumed: caloriesConsumed! +
                                  widget.caloriesAlreadyConsumed!,
                            )),
                  );
                },
                child: const Text('Save'),
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
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 240,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.amberAccent,
                  minRadius: 90,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(widget.model!.imageurl!),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(widget.model!.name!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
