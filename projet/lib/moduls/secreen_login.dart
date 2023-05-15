// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:fitness/shared/components/componentsKhalida.dart';

class loginView extends StatefulWidget {
  const loginView({Key? key}) : super(key: key);

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
  var visable = const Icon(
    Icons.visibility,
    color: Color(0xff4c5166),
  );
  var visableoff = const Icon(
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
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/back.png"), fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 7.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
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
                  const SizedBox(height: 50),
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 4,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    " Welcome back! ",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 100),
                  Field(
                    text: '   E-mail',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  Field(
                    text: '    pasword',
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 35),
                  defaultButton(
                      hight: 52.1,
                      background: const Color(0xffd0fd3e),
                      rad: 21,
                      isapper: false,
                      size: 15,
                      right: () {},
                      text: 'Login'),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("    remeber me",
                          style: TextStyle(color: Colors.white)),
                      TextButton(
                        onPressed: () {
                          // Forgot password button pressed
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 11.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
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
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Sign  in  with ",
                    style: TextStyle(
                        fontSize: 19.2,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("images/gog.png"),
                      const SizedBox(width: 30),
                      Image.asset("images/apple.png"),
                      const SizedBox(width: 30),
                      Image.asset("images/fb.png"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "Don't have an account ?",
                        style: TextStyle(color: Color(0xffcfd7db)),
                      ),
                      TextButton(
                          onPressed:
                              (() {}), //navigation to register screen////////////////////////////////////////////////
                          child: const Text(
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
