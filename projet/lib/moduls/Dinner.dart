// ignore_for_file: file_names, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/Khedma%20Abdou/Aliments.dart';
import 'package:fitness/Khedma%20Abdou/AlimentsInfoWidget.dart';
import 'package:fitness/Khedma%20Abdou/SearchScreenDinner.dart';
import 'package:fitness/moduls/meal.dart';
import 'package:flutter/material.dart';

class Dinner extends StatefulWidget {
  List<Aliments?>? listAliments;
  double caloriesConsumed;
  Dinner({Key? key, this.caloriesConsumed = 0.0, List<Aliments?>? listAliments})
      : listAliments = listAliments ?? [],
        super(key: key);

  @override
  State<Dinner> createState() => _DinnerState();
}

class _DinnerState extends State<Dinner> {
  bool _isVisible = false;
  bool _isTapped = false;
  Color _textColor1 = const Color(0xffD0FD3E);
  Color _underlineColor1 = const Color(0xffD0FD3E);
  Color _textColor2 = Colors.white;
  Color _underlineColor2 = Colors.white;

  void _onTap1() {
    setState(() {
      _textColor1 = const Color(0xffD0FD3E);
      _underlineColor1 = const Color(0xffD0FD3E);
      _textColor2 = Colors.white;
      _underlineColor2 = Colors.white;
      _isVisible = false;
    });
  }

  void _ontap2() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => SearchScreenDinner(
                caloriesAlreadyConsumed: widget.caloriesConsumed,
                listAliments: widget.listAliments,
              )),
    );
  }

  void _toggleVisibility() {
    setState(() {
      _textColor2 = const Color(0xffD0FD3E);
      _underlineColor2 = const Color(0xffD0FD3E);
      _textColor1 = Colors.white;
      _underlineColor1 = Colors.white;
      _isVisible = true;
    });
  }

  Future<QuerySnapshot>? postDocumentsList;
  String alimentText = '';

  initSearchingPost(textEntered) {
    postDocumentsList = FirebaseFirestore.instance
        .collection("Aliments")
        .where("name", isGreaterThanOrEqualTo: textEntered)
        .get();
    setState(() {
      postDocumentsList;
    });
  }

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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                          color: const Color(0xff1d1e1c),
                          borderRadius: BorderRadius.circular(50)),
                      child: GestureDetector(
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xffffffff),
                          weight: 2,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Text(
                      'Dinner',
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
              Text("calories consumed : ${widget.caloriesConsumed}"),
              Container(
                padding: const EdgeInsets.only(left: 20),
                width: 355,
                child: TextField(
                  onTap: _ontap2,
                  decoration: InputDecoration(
                    hintText: 'Search for a food',
                    hintStyle: const TextStyle(
                        color: Color(0xff929292),
                        fontSize: 19,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w700),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Color(0xffc3d292),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              initSearchingPost(alimentText);
                            },
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color(0xff424040),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, top: 20),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: _onTap1,
                        child: Text(
                          'Recent',
                          style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            decorationColor: _underlineColor1,
                            fontWeight: FontWeight.w500,
                            color: _textColor1,
                          ),
                        )),
                    const SizedBox(
                      width: 60,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                            onTap: _toggleVisibility,
                            child: Text(
                              'My food ',
                              style: TextStyle(
                                letterSpacing: 2,
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                decorationColor: _underlineColor2,
                                fontWeight: FontWeight.w500,
                                color: _textColor2,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const Center(
                child: SizedBox(
                  width: 390,
                  child: Divider(
                    thickness: 1,
                    color: Color(0x33ffffff),
                  ),
                ),
              ),
              _isVisible
                  ? Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(height: 90),
                            const SizedBox(width: 30),
                            const Text(
                              'Meals ',
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 2,
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 120),
                            GestureDetector(
                              child: Text(
                                'Create Meal +',
                                style: TextStyle(
                                  color: _isTapped
                                      ? const Color(0xffD0FD3E)
                                      : Colors.white,
                                  letterSpacing: 2,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  _isTapped = true;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const meal()),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    )
                  : widget.listAliments == null || widget.listAliments!.isEmpty
                      ? const Center(
                          child: Text("Vous n'avez encore rien consommé"),
                        )
                      : Expanded(
                          flex: 1,
                          child: ListView.builder(
                              itemCount: widget.listAliments!.length,
                              itemBuilder: (context, index) {
                                Aliments? model = widget.listAliments![index];
                                return AlimentsInfoWidget(aliment: model!);
                              }),
                        )
            ]),
          ),
        ));
  }
}
