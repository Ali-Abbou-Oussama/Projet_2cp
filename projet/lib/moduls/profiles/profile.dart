import 'package:fitness/moduls/profiles/cpasswd.dart';
import 'package:fitness/moduls/profiles/personaldetails.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;
import '../../shared/components/Dialogs/goalw.dart';
import '../../shared/components/components.dart';


class profilescreen extends StatefulWidget {
  const profilescreen({Key? key}) : super(key: key);

  @override
  State<profilescreen> createState() => _profilescreenState();
}

class _profilescreenState extends State<profilescreen> {
  int _selectedIndex = -1;
  final String _name = 'Full Name';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/Splash.png"), fit: BoxFit.cover)),
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 17, top: 10),
                child: Text(
                  ' GetFit',
                  style: TextStyle(
                    color: Color.fromARGB(255, 205, 231, 134),
                    fontSize: 25,
                    fontFamily: 'Inter-Bold',
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                  padding: const EdgeInsets.only(right: 17, top: 10),
                  child: Transform.rotate(
                    angle: -45 * math.pi / 180,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_outlined,
                      ),
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/Pfpic.png")),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 208, 253, 62),
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              _name,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
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
                      builder: (context) => GoalDialog(
                        selectedindex: _selectedIndex,
                      ),
                    );
                    if (result != null) {
                      setState(() {
                        _selectedIndex = result;
                      });
                    }
                  },
                  child: const CustomContainer(
                    title: 'MyGoal',
                    subtitle: 'Change your goal',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pdetails(
                            mygoal: _selectedIndex,
                          ),
                        ));
                  },
                  child: const CustomContainer(
                    title: 'Personal Details',
                    subtitle: 'Change your height, weight...',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const pswd(
                          
                          ),
                        ));},
                  child: const CustomContainer(
                    title: 'Password',
                    subtitle: 'Change your password',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
