import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class HeightDialog extends StatefulWidget {
  final int currentHeight;

  const HeightDialog({Key? key, required this.currentHeight}) : super(key: key);

  @override
  _HeightDialogState createState() => _HeightDialogState();
}

class _HeightDialogState extends State<HeightDialog> {
  late int _currentHeight;

  @override
  void initState() {
    super.initState();
    _currentHeight = widget.currentHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF312E2E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 350,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Height',
              style: TextStyle(
                color: Colors.white,
		fontSize: 19.245473861694336,
		fontFamily: 'WorkSans',
		fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Height is used to determine your daily goal automatically:',
              style: TextStyle(
		color: Color(0xe5ffffff),
		fontSize: 17,
		fontFamily: 'OpenSans',
	),),
            const SizedBox(height: 20),
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
                value: _currentHeight,
                minValue: 100,
                maxValue: 200,
                onChanged: (value) => setState(() => _currentHeight = value),
              ),
            ),
            const Spacer(),
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
                    ),
                  ),
                  const SizedBox(width: 16),
                  TextButton(
                    onPressed: () {
                      print("height: $_currentHeight");
                      Navigator.pop(context, _currentHeight);
                    },
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        fontFamily: 'Work Sans Medium',
                        fontWeight: FontWeight.normal,
                        fontSize: 17,
                        color: Color(0xFFD0FD3E),
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
