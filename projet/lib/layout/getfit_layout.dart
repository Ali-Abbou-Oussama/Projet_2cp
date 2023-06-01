import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fitness/moduls/profiles/profile.dart';
import 'package:fitness/shared/cubit/cubit.dart';
import 'package:fitness/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Khedma Abdou/Aliments.dart';
import '../moduls/Breakfast.dart';
import '../moduls/Dinner.dart';
import '../moduls/Lunch.dart';

// ignore: must_be_immutable
class MyWidget extends StatefulWidget {
  late List<Aliments?>? listAlimentsBreakfast;
  late double? caloriesConsumedBreakfast;
  late List<Aliments?>? listAlimentsLunch;
  late double? caloriesConsumedLunch;
  late List<Aliments?>? listAlimentsDinner;
  late double? caloriesConsumedDinner;
  late Breakfast? screenBreakfast;
  late Dinner? screenDinner;
  late Lunch? screenLunch;
  MyWidget(
      {Key? key,
      this.screenDinner,
      this.caloriesConsumedBreakfast = 0,
      this.caloriesConsumedDinner = 0,
      this.caloriesConsumedLunch = 0,
      this.listAlimentsBreakfast,
      this.screenBreakfast,
      this.listAlimentsDinner,
      this.listAlimentsLunch,
      this.screenLunch})
      : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getFitCubit(
          screenLunch: widget.screenLunch,
          screenDinner: widget.screenDinner,
          caloriesConsumedBreakfast: widget.caloriesConsumedBreakfast,
          caloriesConsumedDinner: widget.caloriesConsumedDinner,
          caloriesConsumedLunch: widget.caloriesConsumedLunch,
          listAlimentsBreakfast: widget.listAlimentsBreakfast,
          listAlimentsDinner: widget.listAlimentsDinner,
          screenBreakfast: widget.screenBreakfast,
          listAlimentsLunch: widget.listAlimentsLunch),
      child: BlocConsumer<getFitCubit, getFitStates>(
        listener: (context, state) {
          setState(() {
            const profilescreen();
          });
        },
        builder: (context, state) {
          return Scaffold(
            body: getFitCubit
                .get(context)
                .screens[getFitCubit.get(context).currentIndex],
            bottomNavigationBar: ConvexAppBar(
              onTap: (index) {
                getFitCubit.get(context).changeBotomNav(index);
              },
              backgroundColor: Colors.grey[900],
              color: const Color(0xFFC3D292),
              activeColor: const Color(0xffd0fd3e),
              style: TabStyle.fixedCircle,
              items: const [
                TabItem(icon: Icons.trending_up),
                TabItem(icon: Icons.auto_stories),
                TabItem(icon: Icons.home),
                TabItem(icon: Icons.self_improvement),
                TabItem(icon: Icons.person),
              ],
              initialActiveIndex: getFitCubit.get(context).currentIndex,
            ),
          );
        },
      ),
    );
  }
}
