// ignore_for_file: must_be_immutable, file_names

import 'package:fitness/Khedma%20Abdou/Aliments.dart';
import 'package:fitness/Khedma%20Abdou/AlimentsDesignWidgetLunch.dart';
import 'package:fitness/moduls/Dinner.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../moduls/Breakfast.dart';
import 'MealWidget.dart';

class SearchScreenLunch extends StatefulWidget {
  List<Aliments?>? listAliments;
  double? caloriesAlreadyConsumed;
  late List<Aliments?>? listAlimentsBreakfast;
  late double? caloriesConsumedBreakfast;
  late List<Aliments?>? listAlimentsDinner;
  late double? caloriesConsumedDinner;
  double? caloriesAjoute;
  late Breakfast? screenBreakfast;
  late Dinner? screenDinner;
  List<MealWidget>? listeMeal;
  SearchScreenLunch(
      {Key? key,
      this.caloriesAlreadyConsumed,
      this.listAliments,
      this.caloriesConsumedDinner,
      this.caloriesConsumedBreakfast,
      this.listAlimentsDinner,
      this.listAlimentsBreakfast,
      this.caloriesAjoute,
      required this.listeMeal,
      required this.screenBreakfast,
      required this.screenDinner})
      : super(key: key);

  @override
  State<SearchScreenLunch> createState() => _SearchScreenLunchState();
}

class _SearchScreenLunchState extends State<SearchScreenLunch> {
  Future<QuerySnapshot>? postDocumentsList;
  String alimentText = '';
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  initSearchingPost(String textEntered) {
    setState(() {
      if (textEntered.isEmpty) {
        postDocumentsList = null;
      } else {
        postDocumentsList = FirebaseFirestore.instance
            .collection("Aliments")
            .where("normalizedText", isGreaterThanOrEqualTo: textEntered)
            .where("normalizedText", isLessThanOrEqualTo: '$textEntered\uf8ff')
            .get();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff424040),
          title: Container(
            padding: const EdgeInsets.only(left: 20),
            width: 355,
            child: TextField(
              focusNode: focusNode,
              onChanged: (textEntered) {
                setState(() {
                  alimentText = textEntered;
                  if (textEntered.isEmpty) {
                    postDocumentsList = null;
                  } else {
                    initSearchingPost(textEntered);
                  }
                });
              },
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
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/back.png"), fit: BoxFit.cover),
          ),
          child: FutureBuilder<QuerySnapshot>(
            future: postDocumentsList,
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        Aliments model = Aliments.fromJson(
                            snapshot.data!.docs[index].data()!
                                as Map<String, dynamic>);
                        return AlimentsDesignWidgetLunch(
                          listeMeal: widget.listeMeal,
                          screenBreakfast: widget.screenBreakfast,
                          screenDinner: widget.screenDinner,
                          caloriesAjoute: widget.caloriesAjoute,
                          listAliments: widget.listAliments,
                          model: model,
                          context: context,
                          caloriesAlreadyConsumed:
                              widget.caloriesAlreadyConsumed,
                          caloriesConsumedDinner: widget.caloriesConsumedDinner,
                          caloriesConsumedBreakfast:
                              widget.caloriesConsumedBreakfast,
                          listAlimentsDinner: widget.listAlimentsDinner,
                          listAlimentsBreakfast: widget.listAlimentsBreakfast,
                        );
                      })
                  : const Center(
                      child: Text(
                          "Pas d'aliments qui correspondent à votre recherche"),
                    );
            },
          ),
        ),
      ),
    );
  }
}
