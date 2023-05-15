// ignore_for_file: camel_case_types, avoid_unnecessary_containers

import 'package:fitness/moduls/Breakfast.dart';
import 'package:fitness/moduls/Serving.dart';
import 'package:flutter/material.dart';

class meal extends StatefulWidget {
  const meal({Key? key}) : super(key: key);

  @override
  State<meal> createState() => _mealState();
}

class _mealState extends State<meal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/back.png"), fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            color: const Color(0xff1d1e1c),
                            borderRadius: BorderRadius.circular(50)),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Breakfast()),
                              );
                            },
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Text(
                        'Create meal',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          letterSpacing: 2,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Container(
                      padding: const EdgeInsets.only(left: 20.0),
                      decoration: BoxDecoration(
                          color: const Color(0xff312E2E),
                          borderRadius: BorderRadius.circular(8)),
                      width: 350,
                      height: 61,
                      child: Row(
                        children: [
                          const Text(
                            ' Name',
                            style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 21,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: '    New  food  name',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 27.0),
                  child: Container(
                    padding: const EdgeInsets.only(top: 13, left: 30),
                    decoration: BoxDecoration(
                        color: const Color(0xff312E2E),
                        borderRadius: BorderRadius.circular(8)),
                    width: 350,
                    height: 103,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ingredients',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 1,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Center(
                          child: SizedBox(
                            width: 311,
                            child: Divider(
                              thickness: 1,
                              color: Color(0x33ffffff),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              'Add igredient',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: 1,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              width: 160,
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Breakfast()),
                                );
                              },
                              color: const Color(0xffffffff),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 27.0),
                  child: Container(
                    padding: const EdgeInsets.only(top: 13, left: 30),
                    decoration: BoxDecoration(
                        color: const Color(0xff312E2E),
                        borderRadius: BorderRadius.circular(8)),
                    width: 350,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Servings',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 1,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          'Whole meal',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            letterSpacing: 1,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          '0 g',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const Center(
                          child: SizedBox(
                            width: 311,
                            child: Divider(
                              thickness: 1,
                              color: Color(0x33ffffff),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              'Add Serving',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: 1,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              width: 160,
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Serving()),
                                );
                              },
                              color: const Color(0xffffffff),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
