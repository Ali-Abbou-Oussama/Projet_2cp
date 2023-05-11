import 'package:fitness/moduls/meal.dart';
import 'package:flutter/material.dart';

class Breakfast extends StatefulWidget {
  const Breakfast({Key? key}) : super(key: key);

  @override
  State<Breakfast> createState() => _BreakfastState();
}

class _BreakfastState extends State<Breakfast> {
  bool _isVisible = false;

  bool _isTapped = false;
  final List<Widget> _elements = [];

  Color _textColor1 = Colors.white;
  Color _underlineColor1 = Colors.white;
  Color _textColor2 = Colors.white;
  Color _underlineColor2 = Colors.white;

  void _onTap1() {
    setState(() {
      _textColor1 = const Color(0xffD0FD3E);
      _underlineColor1 = const Color(0xffD0FD3E);
    });
  }

  void _onTap2() {
    setState(() {
      _textColor2 = const Color(0xffD0FD3E);
      _underlineColor2 = const Color(0xffD0FD3E);
    });
  }

  void _toggleVisibility() {
    setState(() {
      _textColor2 = const Color(0xffD0FD3E);
      _underlineColor2 = const Color(0xffD0FD3E);
      _isVisible = !_isVisible;
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Breakfast()),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Text(
                      'Brakfast',
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
                padding: const EdgeInsets.only(left: 20),
                width: 355,
                child: TextField(
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
                              // Do something when the button is pressed
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
              Visibility(
                visible: _isVisible,
                child: Column(
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
                ),
              ),
            ]),
          ),
        ));
  }
}
