import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class loginView extends StatefulWidget {
  const loginView({super.key});

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
  var visable = Icon(
    Icons.visibility,
    color: Color(0xff4c5166),
  );
  var visableoff = Icon(
    Icons.visibility_off,
    color: Color(0xff4c5166),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/Splash.png"), fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 7.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Sign up    ",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      defaultButton(
                          size: 14,
                          right: () {},
                          text: 'Login',
                          isapper: false,
                          width: 88,
                          rad: 21)
                    ],
                  ),
                  SizedBox(height: 50),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 4,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    " Welcome back! ",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.12,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 100),
                  Field(
                    text: '   E-mail',
                  ),
                  SizedBox(height: 20),
                  Field(text: '    pasword'),
                  SizedBox(height: 35),
                  defaultButton(
                      hight: 52.1,
                      background: Color(0xffd0fd3e),
                      rad: 21,
                      isapper: false,
                      size: 15,
                      right: () {},
                      text: 'Login'),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("    remeber me",
                          style: TextStyle(color: Colors.white)),
                      TextButton(
                        onPressed: () {
                          // Forgot password button pressed
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 11.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 155,
                            child: Divider(
                              thickness: 1,
                              color: Color(0xff757171),
                            ),
                          ),
                          Text(
                            "    or    ",
                            style: TextStyle(
                                fontSize: 12,
                                letterSpacing: 0.12,
                                color: Color(0xffc9b8b8)),
                          ),
                          SizedBox(
                            width: 155,
                            child: Divider(
                              thickness: 1,
                              color: Color(0xff757171),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Sign  in  with ",
                    style: TextStyle(
                        fontSize: 19.2,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("images/google.png"),
                      SizedBox(width: 30),
                      Image.asset("images/apple.png"),
                      SizedBox(width: 30),
                      Image.asset("images/fb.png"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Don't have an account ?",
                        style: TextStyle(color: Color(0xffcfd7db)),
                      ),
                      TextButton(
                          onPressed:
                              (() {}), //navigation to register screen////////////////////////////////////////////////
                          child: Text(
                            "Sing Up",
                            style: TextStyle(
                                color: Color(0xffd0fd3e), fontSize: 13.5),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}