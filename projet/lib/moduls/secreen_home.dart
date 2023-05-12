import 'package:flutter/material.dart';

import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class homeview extends StatefulWidget {
  const homeview({Key? key}) : super(key: key);

  @override
  State<homeview> createState() => _homeviewState();
}

class _homeviewState extends State<homeview> {
  int? breakFastCalories;
  int DinnerCalories = 0;
  int LunchCalories = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/back.png"), fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Row(children: [
                      const Text(
                        'GetFit',
                        style: TextStyle(
                          color: Color(0xffc3d292),
                          fontSize: 25,
                          letterSpacing: 4,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        width: 220,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_outlined,
                        ),
                      )
                    ]),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Container(
                            child: Stack(
                          children: [
                            const SizedBox(width: 22),
                            const Positioned(
                              top: 18,
                              left: 30,
                              child: Text(
                                'Remaining',
                                style: TextStyle(
                                  letterSpacing: 2,
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                            SimpleCircularProgressBar(
                              valueNotifier: ValueNotifier(652),
                              mergeMode: false,
                              size: 155,
                              animationDuration: 3,
                              onGetText: (double value) {
                                return const Text(
                                  '652  Cal',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                );
                              },
                              progressStrokeWidth: 5,
                              backStrokeWidth: 5,
                              progressColors: const [
                                Color(0xffd0fd3e),
                                Color(0xffff2424)
                              ],
                            ),
                          ],
                        )),
                        const SizedBox(width: 22),
                        Container(
                            child: Stack(
                          children: [
                            const Positioned(
                              top: 15,
                              left: 26,
                              child: Text(
                                'Eaten',
                                style: TextStyle(
                                  letterSpacing: 2,
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                            SimpleCircularProgressBar(
                              valueNotifier: ValueNotifier(1023),
                              mergeMode: false,
                              animationDuration: 3,
                              onGetText: (double value) {
                                return const Text(
                                  '1023  Cal',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              },
                              progressStrokeWidth: 5,
                              backStrokeWidth: 5,
                              progressColors: const [
                                Color(0xffd0fd3e),
                                Color(0xffff2424)
                              ],
                            ),
                          ],
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 57,
                    ),
                    Row(
                      children: [
                        Container(
                            child: Stack(
                          children: [
                            const SizedBox(width: 22),
                            const Positioned(
                              top: 13,
                              left: 40,
                              child: Text(
                                'Fat',
                                style: TextStyle(
                                  letterSpacing: 2,
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                            SimpleCircularProgressBar(
                              valueNotifier: ValueNotifier(25),
                              mergeMode: false,
                              animationDuration: 3,
                              onGetText: (double value) {
                                return Text(
                                  '${value.toInt()}%',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              },
                              progressStrokeWidth: 5,
                              backStrokeWidth: 5,
                              progressColors: const [Color(0xffd0fd3e)],
                            ),
                          ],
                        )),
                        const SizedBox(width: 22),
                        Container(
                            child: Stack(
                          children: [
                            const Positioned(
                              top: 9,
                              left: 22,
                              child: Text(
                                'Protein',
                                style: TextStyle(
                                  letterSpacing: 2,
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                            SimpleCircularProgressBar(
                              valueNotifier: ValueNotifier(45),
                              mergeMode: false,
                              animationDuration: 3,
                              onGetText: (double value) {
                                return Text(
                                  '${value.toInt()}%',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              },
                              progressStrokeWidth: 5,
                              backStrokeWidth: 5,
                              progressColors: const [Color(0xffff2424)],
                            ),
                          ],
                        )),
                        const SizedBox(width: 22),
                        Container(
                            child: Stack(
                          children: [
                            const Positioned(
                              top: 9,
                              left: 25,
                              child: Text(
                                'Carbs',
                                style: TextStyle(
                                  letterSpacing: 2,
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                            SimpleCircularProgressBar(
                              valueNotifier: ValueNotifier(30),
                              mergeMode: false,
                              animationDuration: 3,
                              onGetText: (double value) {
                                return Text(
                                  '${value.toInt()}%',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              },
                              progressStrokeWidth: 5,
                              backStrokeWidth: 5,
                              progressColors: const [Color(0xffe79332)],
                            ),
                          ],
                        ))
                      ],
                    ),
                    const SizedBox(height: 30),
                    Column(
                      children: const [
                        ListTile(
                          title: Text(
                            'Breakfast',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19.245473861694336,
                              fontFamily: 'WorkSans',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            'Recommended ',
                            style: TextStyle(
                                color: Color(0xff929292),
                                fontSize: 10,
                                fontFamily: 'WorkSans',
                                fontWeight: FontWeight.w700),
                          ),
                          trailing: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Lunch',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19.245473861694336,
                              fontFamily: 'WorkSans',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            'Recommended 592 cal',
                            style: TextStyle(
                                color: Color(0xff929292),
                                fontSize: 10,
                                fontFamily: 'WorkSans',
                                fontWeight: FontWeight.w700),
                          ),
                          trailing: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Dinner',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19.245473861694336,
                              fontFamily: 'WorkSans',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            'Recommended 423 cal',
                            style: TextStyle(
                                color: Color(0xff929292),
                                fontSize: 10,
                                fontFamily: 'WorkSans',
                                fontWeight: FontWeight.w700),
                          ),
                          trailing: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 28,
                          ),
                        )
                      ],
                    ),
                  ]),
                )),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color(0xffc3d292),
              onPressed: () {},
              child: const Icon(
                Icons.search,
                color: Colors.black,
                size: 40,
              ),
            )));
  }
}
