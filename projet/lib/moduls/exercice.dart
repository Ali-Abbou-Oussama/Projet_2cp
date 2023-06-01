import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class workout extends StatefulWidget {
  const workout({Key? key}) : super(key: key);

  @override
  State<workout> createState() => _workoutState();
}

class _workoutState extends State<workout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/Splash.png"), fit: BoxFit.cover)),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'GetFit',
                  style: TextStyle(
                    color: Color(0xffc3d292),
                    fontSize: 25,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Flexible(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  const Text(
                    ' Upper body',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.245473861694336,
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CustomImageCard2(
                          imagePath: 'images/exo1 (1).gif',
                          title: 'Incline dumbell press',
                          subtitle: '3 sets of 10',
                        ),
                        CustomImageCard2(
                          imagePath: 'images/exo2.gif',
                          title: 'Abdominal leg raises',
                          subtitle: '4 sets of 12',
                        ),
                        CustomImageCard2(
                          imagePath: 'images/exo3.gif',
                          title: 'Bench press',
                          subtitle: '3 sets of 10',
                        ),
                        CustomImageCard2(
                          imagePath: 'images/exo4.gif',
                          title: 'Diamond pushups',
                          subtitle: '4 sets of 10',
                        ),
                        CustomImageCard2(
                          imagePath: 'images/exo5.gif',
                          title: 'Single arm curls',
                          subtitle: '3 sets of 12',
                        ),
                        CustomImageCard2(
                          imagePath: 'images/exo6.gif',
                          title: 'Triceps curls',
                          subtitle: '3 sets of 10',
                        ),
                        CustomImageCard2(
                          imagePath: 'images/exo7.gif',
                          title: 'Side to side crunches',
                          subtitle: '4 sets of 10',
                        ),
                        CustomImageCard2(
                          imagePath: 'images/exo12.gif',
                          title: 'Pull ups',
                          subtitle: '3 sets of 10',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    ' Lower body',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.245473861694336,
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CustomImageCard2(
                          imagePath: 'images/exo8.gif',
                          title: 'Deadlift',
                          subtitle: '3 sets of 8',
                        ),
                        CustomImageCard2(
                          imagePath: 'images/exo9.gif',
                          title: 'Single leg squats',
                          subtitle: '3 sets of 10',
                        ),
                        CustomImageCard2(
                          imagePath: 'images/exo10.gif',
                          title: 'Calf raises',
                          subtitle: '4 sets of 12',
                        ),
                        CustomImageCard2(
                          imagePath: 'images/exo11.gif',
                          title: 'Back leg raises',
                          subtitle: '4 sets of 10',
                        ),
                        CustomImageCard2(
                          imagePath: 'images/exo13.gif',
                          title: 'Single body weight squat',
                          subtitle: '4 sets of 10',
                        ),
                        CustomImageCard2(
                          imagePath: 'images/exo14.gif',
                          title: 'Knees outside squat',
                          subtitle: '4 sets of 10',
                        ),
                        CustomImageCard2(
                          imagePath: 'images/exo15.gif',
                          title: 'Guided squats',
                          subtitle: '3 sets of 10',
                        ),
                      ],
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
