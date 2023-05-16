import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fitness/shared/cubit/cubit.dart';
import 'package:fitness/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getFitCubit(),
      child: BlocConsumer<getFitCubit, getFitStates>(
        listener: (context, state) {},
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
              color: Color(0xFFC3D292),
              activeColor: const Color(0xffd0fd3e),
              style: TabStyle.fixedCircle,
              items: [
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
