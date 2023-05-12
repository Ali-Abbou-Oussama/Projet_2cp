import 'package:flutter/material.dart';

class Serving extends StatefulWidget {
  const Serving({Key? key}) : super(key: key);

  @override
  State<Serving> createState() => _ServingState();
}

class _ServingState extends State<Serving> {
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 80),
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
                          'Add Serving',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            letterSpacing: 1,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          child: const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hintText: '   Serving name      ',
                              hintStyle: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: const [
                            Text(
                              '  Serving size ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: 1,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              '  g',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: 1,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              width: 100,
                            ),
                            Text(
                              'Cancel ',
                              style: TextStyle(
                                letterSpacing: 1,
                                color: Color(0xffD0FD3E),
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              ' Save ',
                              style: TextStyle(
                                fontSize: 19,
                                color: Color(0xffD0FD3E),
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1,
                              ),
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
