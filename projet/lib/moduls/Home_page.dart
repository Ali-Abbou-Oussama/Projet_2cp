// ignore_for_file: file_names, depend_on_referenced_packages, non_constant_identifier_names

import 'package:fitness/moduls/lineChart.dart';
import 'package:fitness/moduls/pie_graph.dart';
import 'package:flutter/material.dart';
import 'package:fitness/moduls/bar_graph.dart';
import 'package:fitness/moduls/pricePoints.dart';
import 'package:collection/collection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<double> weeklySummary = [
    0,
    0,
    0,
    2240,
    0,
    0,
    0,
  ];
  List<PricePoint> get PricePoints {
    final data = <double>[2, 4, 6, 11, 3, 6, 4];
    return data
        .mapIndexed(
            ((index, element) => PricePoint(x: index.toDouble(), Y: element)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/back.png"), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Row(
                children: [
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
                ],
              ),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(10),
                width: 350,
                height: 270,
                decoration: BoxDecoration(
                  color: const Color(0xff312e2e),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Calorie intake',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      'Average daily goal:',
                      style: TextStyle(
                        color: Color(0xff929292),
                        fontSize: 9,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Center(
                        child: SizedBox(
                      height: 215,
                      child: MyBarGraph(
                        weeklySummary: weeklySummary,
                      ),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(10),
                width: 350,
                height: 270,
                decoration: BoxDecoration(
                  color: const Color(0xff312e2e),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Macro Balance',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'WorkSans',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Average For Chosen period',
                              style: TextStyle(
                                color: Color(0xff929292),
                                fontSize: 9,
                                fontFamily: 'WorkSans',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 130),
                        Text(
                          'Diet goal',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: pieChart(),
                    ),
                    const SizedBox(height: 12),
                    const Center(
                      child: SizedBox(
                        width: 285,
                        child: Divider(
                          thickness: 1,
                          color: Color(0x33ffffff),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 13),
                        Container(
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                              color: const Color(0xffff2424),
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        const SizedBox(width: 11),
                        const Text(
                          'Protein',
                          style: TextStyle(
                            color: Color(0xa5ffffff),
                            fontSize: 16,
                            fontFamily: 'NunitoSans',
                          ),
                        ),
                        const SizedBox(width: 60),
                        Container(
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                              color: const Color(0xffe79332),
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        const SizedBox(width: 11),
                        const Text(
                          'Carbs',
                          style: TextStyle(
                            color: Color(0xa5ffffff),
                            fontSize: 16,
                            fontFamily: 'NunitoSans',
                          ),
                        ),
                        const SizedBox(width: 60),
                        Container(
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                              color: const Color(0xffd0fd3e),
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        const SizedBox(width: 11),
                        const Text(
                          'Fat',
                          style: TextStyle(
                            color: Color(0xa5ffffff),
                            fontSize: 16,
                            fontFamily: 'NunitoSans',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: 350,
                height: 400,
                decoration: BoxDecoration(
                  color: const Color(0xff312e2e),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Weight tracker',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      'Log in your weight daily for better tracking',
                      style: TextStyle(
                        color: Color(0xff929292),
                        fontSize: 9,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: LineChartWidget(),
                    ),
                     Row(
                      children: [
                        SizedBox(width: 210),
                        Text(
                          'Log weight',
                          style: TextStyle(
                            color: Color(0xffd0fd3e),
                            fontSize: 17,
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
