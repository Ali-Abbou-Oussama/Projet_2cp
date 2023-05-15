import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

class WeightDialog extends StatefulWidget {
  final WeightSliderController controller;
  final double initialWeight;

  const WeightDialog({
    Key? key,
    required this.controller,
    required this.initialWeight,
  }) : super(key: key);

  @override
  _WeightDialogState createState() => _WeightDialogState();
}

class _WeightDialogState extends State<WeightDialog> {
  late WeightSliderController _controller;
  late double _weight;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _weight = widget.initialWeight;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF312E2E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 380,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Weight',
              style: TextStyle(
                color: Colors.white,
		fontSize: 19.245473861694336,
		fontFamily: 'WorkSans',
		fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Weight is used to determine your daily goal automatically:',
              style: TextStyle(
		color: Color(0xe5ffffff),
		fontSize: 17,
		fontFamily: 'OpenSans',
	),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "${_weight.toStringAsFixed(1)} kg",
                style: const TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: Transform.rotate(
                angle: (-90 * 3.14) / 180,
                child: VerticalWeightSlider(
                  controller: _controller,
                  decoration: const PointerDecoration(
                    width: 100.0,
                    height: 3.0,
                    largeColor: Color(0xffd0fd3e),
                    mediumColor: Color(0xffd0fd3e),
                    smallColor: Color(0xffd0fd3e),
                    gap: 30.0,
                  ),
                  onChanged: (double value) {
                    print("onChanged: $value");
                    setState(() {
                      _weight = value;
                    });
                  },
                  indicator: Container(
                    height: 2.0,
                    width: 60.0,
                    alignment: Alignment.centerLeft,
                    color: const Color(0xffd0fd3e),
                  ),
                ),
              ),
            ),
           
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
  'Cancel',
  style: TextStyle(
    fontFamily: 'Work Sans Medium',
    fontWeight: FontWeight.normal,
    fontSize: 17,
    color: Color(0xFFD0FD3E),
  ),
)
                  ),
                  const SizedBox(width: 16),
                  TextButton(
                    onPressed: () {
                      print("Weight: $_weight");
                      Navigator.pop(context, _weight);
                    },
                    child: const Text(
  'OK',
  style: TextStyle(
    fontFamily: 'Work Sans Medium',
    fontWeight: FontWeight.normal,
    fontSize: 17,
    color: Color(0xFFD0FD3E),
  ),
)

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
