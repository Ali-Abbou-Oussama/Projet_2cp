// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'Aliments.dart';

class AlimentsInfoWidget extends StatelessWidget {
  final Aliments aliment;

  const AlimentsInfoWidget({Key? key, required this.aliment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nom: ${aliment.name}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text('Calories: ${aliment.calories}'),
        Text('Protéines: ${aliment.proteins}'),
        Text('Glucides: ${aliment.carbohydrates}'),
        Text('Lipides: ${aliment.lipids}'),
      ],
    );
  }
}
