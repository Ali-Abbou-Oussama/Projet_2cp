// ignore_for_file: depend_on_referenced_packages, file_names, non_constant_identifier_names

import 'package:collection/collection.dart';

class PricePoint {
  final double x;
  final double Y;
  PricePoint({required this.x, required this.Y});
  List<PricePoint> get PricePoints {
    final data = <double>[16, 12, 10, 20, 3, 6, 4];
    return data
        .mapIndexed(
            ((index, element) => PricePoint(x: index.toDouble(), Y: element)))
        .toList();
  }
}
