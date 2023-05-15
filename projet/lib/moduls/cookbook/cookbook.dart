import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class cookbk extends StatefulWidget {
  const cookbk({Key? key}) : super(key: key);
  @override
  State<cookbk> createState() => _cookbkState();
}

class _cookbkState extends State<cookbk> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/Splash.png"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 17,),
              child: defaultText(
                  text: 'GetFit',
                  family: "Inter",
                  colortext: const Color(0xffc3d292),
                  size: 25.0,
                  weight: FontWeight.w600),
            ),
            Container(
              padding: const EdgeInsets.only(left: 17, top: 20),
              child: const Text(
                ' Breakfast',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.245473861694336,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CustomImageCard(
                    imagePath: 'images/oat.png',
                    title: 'Instant Pot Oatmeal',
                    subtitle: '214 cal',
                  ),
                  CustomImageCard(
                    imagePath: 'images/pancake.png',
                    title: 'Pancake Mix',
                    subtitle: '92 cal',
                  ),
                  CustomImageCard(
                    imagePath: 'images/eggs.png',
                    title: 'Scrambled Eggs',
                    subtitle: '199 cal',
                  ),
                  CustomImageCard(
                    imagePath: 'images/bananapb.png',
                    title: 'Banana And Peanut Butter',
                    subtitle: '322 cal',
                  ),
                  CustomImageCard(
                    imagePath: 'images/waffles.png',
                    title: 'Buttermilk Waffles',
                    subtitle: '273 cal',
                  ),
                  CustomImageCard(
                    imagePath: 'images/cookies.png',
                    title: 'Chocolate Chip Muffins',
                    subtitle: '273 cal',
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 17, top: 20),
              child: const Text(
                ' Lunch&Dinner',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.245473861694336,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CustomImageCard(
                    imagePath: 'images/Paella.png',
                    title: 'Paella',
                    subtitle: '341 cal',
                  ),
                  CustomImageCard(
                    imagePath: 'images/Spaghetti.png',
                    title: 'Spaghetti Bolognaise',
                    subtitle: '297 cal',
                  ),
                  CustomImageCard(
                    imagePath: 'images/SaSChicken.png',
                    title: 'Sweet And Sour Chicken',
                    subtitle: '463 cal',
                  ),
                  CustomImageCard(
                    imagePath: 'images/Lamb Tagine.png',
                    title: 'Lamb Tagine',
                    subtitle: '343 cal',
                  ),
                  CustomImageCard(
                    imagePath: 'images/Harira.png',
                    title: 'Harira',
                    subtitle: '367 cal',
                  ),
                  CustomImageCard(
                    imagePath: 'images/Chakchouka.png',
                    title: 'Chakchouka',
                    subtitle: '273 cal',
                  ),
                  CustomImageCard(
                    imagePath: 'images/mushroom.png',
                    title: 'Chicken mushroom Pasta',
                    subtitle: '693 cal',
                  ),
                  CustomImageCard(
                    imagePath: 'images/cajun.png',
                    title: 'Cajun chicken Pasta',
                    subtitle: '701 cal',
                  ),
                  CustomImageCard(
                    imagePath: 'images/beef.png',
                    title: 'Beef stir fry',
                    subtitle: '210 cal',
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 17, top: 40),
              child: const Text(
                ' Snacks ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.245473861694336,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CustomImageCard(
                    imagePath: 'images/smoothie.png',
                    title: 'Chocolate Smoothie',
                    subtitle: '386 cal',
                  ),
                  CustomImageCard(
                    imagePath: 'images/proteinbar.png',
                    title: 'Protein Bar',
                    subtitle: '414 cal',
                  ),
                  CustomImageCard(
                    imagePath: 'images/pbapple.png',
                    title: 'Peanut butter apple',
                    subtitle: '283 cal',
                  ),
                  CustomImageCard(
                    imagePath: 'images/pbcookies.png',
                    title: 'Pb protein cookies',
                    subtitle: '192 cal',
                  ),
                  CustomImageCard(
                    imagePath: 'images/oatfr.png',
                    title: 'Oatmeal with fruits',
                    subtitle: '300 cal',
                  ),
                  CustomImageCard(
                    imagePath: 'images/trail.png',
                    title: 'Trail mix',
                    subtitle: '462 cal',
                  ),
                ],
              ),
            )
          ],
        ),
      );
   
  }
}
