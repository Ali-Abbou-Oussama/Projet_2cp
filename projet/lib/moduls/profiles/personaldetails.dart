import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

import '../../shared/components/Dialogs/activityw.dart';
import '../../shared/components/Dialogs/agew.dart';
import '../../shared/components/components.dart';
import '../../shared/components/Dialogs/heightw.dart';
import '../../shared/components/Dialogs/weightw.dart';

class pdetails extends StatefulWidget {
  final int mygoal;
  const pdetails({Key? key, required this.mygoal}) : super(key: key);
  @override
  State<pdetails> createState() => _pdetailsState();
}

class _pdetailsState extends State<pdetails> {
  late WeightSliderController _controller;
  double _initialWeight = 30.0;
late int _goaal; 
 String _activitys='moderate activity';
  
  
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
  void initState() {
    super.initState();
    _controller = WeightSliderController(initialWeight: _initialWeight);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

    int _currentValue=170 ;
double _activity = 1;
  int _age=20;
 
  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
         body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/Splash.png"), fit: BoxFit.cover)),
          child: Column(
            children: [
              const SizedBox(
                height: 42,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 5, top: 10),
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            color: const Color(0xff1d1e1c),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Personal details',
                    style: TextStyle(
                      fontFamily: 'Work Sans Semibold',
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                      height: 1.5,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                    strutStyle: StrutStyle(
                      height: 1.5,
                      leading: 0.5,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 69,
              ),
              SizedBox(
                height: 400,
                width: 340,
                child: ListView(
                  children: [
                    
                    InkWell(
                     onTap: () async {
         final result = await showDialog(
           context: context,
           builder: (context) {
             return WeightDialog(
          controller: _controller,
          initialWeight: _initialWeight,
             );
           },
         );
         if (result != null && result is double) {
           setState(() {
             _initialWeight = result;
             _controller = WeightSliderController(initialWeight: _initialWeight);
           });
         }
       },
                      child: CustomContainer(
                        title: 'Weight',
                        subtitle: 'Last set $_initialWeight kg',
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () async {
                        
         final result = await showDialog(
         
           context: context,
           builder: (context) {
             return HeightDialog(
          currentHeight: _currentValue,
             );
           },
         );
         if (result != null) {
           setState(() {
             _currentValue = result;
           });
         }
       },
       
                    
                      child:  CustomContainer(
                        title: 'Height',
                        subtitle: 'Last set $_currentValue Cm',
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () async {
                        
         final result = await showDialog(
         
           context: context,
           builder: (context) {
             return AgeDialog(
          currentAge: _age,
             );
           },
         );
         if (result != null) {
           setState(() {
             _age = result;
           });
         }
  print(widget.mygoal);
       },
                      child:  CustomContainer(
                        title: 'Your age',
                        subtitle: 'Last set $_age years old',
                      ),
                    ),
                      const SizedBox(
                      height: 15,
                    ),
                     InkWell(
                      onTap: () async {
                        
         final result = await showDialog(
         
           context: context,
           builder: (context) {
             return ActivityDialog(
          currentActivity: _activity ,
             );
           },
         );
         if (result != null) {
           setState(() {
             _activity = result;
             _activitys = getActivityLevelString(_activity);
           });
         }
  print(widget.mygoal);
       },
                      child:    CustomContainer(
                        title: 'Activity level',
                        subtitle: 'Last set $_activitys ',
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
