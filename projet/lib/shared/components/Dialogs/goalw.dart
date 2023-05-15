import 'package:flutter/material.dart';

import '../components.dart';

class GoalDialog extends StatefulWidget {
  final int selectedindex;
    const GoalDialog({Key? key, required this.selectedindex}) : super(key: key);
  @override
  State<GoalDialog> createState() => _GoalDialogState();
}

class _GoalDialogState extends State<GoalDialog> {
 late  int _selectedButtonIndex ; // Initially, no button is selected

  final List<String> _buttonTexts = ['Lose Weight', 'Maintain Weight', 'Gain Weight'];

 @override
  void initState() {
    super.initState();
    _selectedButtonIndex= widget.selectedindex;
  }
  String getSelectedButtonText() {
  if (_selectedButtonIndex >= 0 && _selectedButtonIndex < _buttonTexts.length) {
    return _buttonTexts[_selectedButtonIndex];
  }
  return ""; // or any default value you want to return if no button is selected
}
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF312E2E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 356,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'My Goal',
              style: TextStyle(
                color: Colors.white,
		fontSize: 19.245473861694336,
		fontFamily: 'WorkSans',
		fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Set your goal:',
              style: TextStyle(
		color: Color(0xe5ffffff),
		fontSize: 17,
		fontFamily: 'OpenSans',
	),),
  const SizedBox(height: 10,),
  for (int i = 0; i < _buttonTexts.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Center(
                child: defaultButton(
                  background: _selectedButtonIndex == i
                      ? const Color(0xffd0fd3e)
                      : const Color.fromARGB(255, 104, 101, 101),
                  family: "Inter",
                  size: 13,
                  text: _buttonTexts[i],
                  hight: 45,
                  rad: 4,
                  width: 140,
                  right: () {
                    setState(() {
                      _selectedButtonIndex = i;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            
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
                      
                     Navigator.pop(context, _selectedButtonIndex);
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