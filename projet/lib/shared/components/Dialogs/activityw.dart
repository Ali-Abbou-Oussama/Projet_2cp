import 'package:flutter/material.dart';
class ActivityDialog extends StatefulWidget {
 final double currentActivity;

  const ActivityDialog({Key? key, required this.currentActivity}) : super(key: key);

  @override
  State<ActivityDialog> createState() => _ActivityDialogState();
}
  class _ActivityDialogState extends State<ActivityDialog> {
  late double _activityLevel; // default value
  late String _activityLevelString;

  @override
  void initState() {
    super.initState();
    _activityLevel = widget.currentActivity;
    _activityLevelString = getActivityLevelString(_activityLevel);
  }

  String getActivityLevelString(double value) {
    if (value == 0.0) {
      return 'Low activity';
    } else if (value == 1.0) {
      return 'Moderate activity';
    } else if (value == 2.0) {
      return 'High activity';
    } else {
      return 'Very high activity';
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF312E2E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 300,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'ACtivity level',
              style: TextStyle(
                color: Colors.white,
		fontSize: 19.245473861694336,
		fontFamily: 'WorkSans',
		fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Activity level is used to determine your daily goal automatically:',
              style: TextStyle(
		color: Color(0xe5ffffff),
		fontSize: 17,
		fontFamily: 'OpenSans',
	),),
            const SizedBox(height: 20),
            Text(
                    getActivityLevelString(_activityLevel),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        decoration: TextDecoration.none,
                        color: Color(0xffb6b6b6),
                        fontWeight: FontWeight.w700,
                        fontFamily: "OpenSans",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),

                  ),
                  const SizedBox(
                    height: 40,
                  ),
                   SizedBox(
                    height: 2,
                    child: Material(
                      color: Colors.transparent,
                      child: 
Slider(
  activeColor: const Color(0xffd0fd3e),
  value: _activityLevel,
  max: 3,
  min: 0,
  label: _activityLevelString,
  onChanged: ((double value) {
       if (value >= 0 && value <= 3) {
      setState(() {
        _activityLevel = value;
        
      });
    }

  }),
),
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
                      print(_activityLevel);
                      print("Activity level: $_activityLevelString");
                      Navigator.pop(context, _activityLevel);
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