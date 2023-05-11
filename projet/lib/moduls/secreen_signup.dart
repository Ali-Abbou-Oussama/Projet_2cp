import 'package:flutter/material.dart';
import 'package:fitness/shared/components/componentsKhalida.dart';

class signupView extends StatefulWidget {
  const signupView({Key? key}) : super(key: key);

  @override
  State<signupView> createState() => _signupViewState();
}

class _signupViewState extends State<signupView> {
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
            //width: 400,
            //height: 810,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/back.png"), fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 7.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      defaultButton(
                          size: 14,
                          right: () {},
                          text: 'Sign up',
                          isapper: false,
                          width: 88,
                          rad: 21),
                      const SizedBox(width: 20),
                      const Text(
                        "Login    ",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 4,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    " To join the GetFit community ",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Field(
                    text: '   Enter your full name',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 15),
                  Field(
                    text: '    Enter an E-mail',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),
                  Field(
                    text: '   Enter a password ',
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 15),
                  Field(
                    text: '    confirm the password',
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 25),
                  defaultButton(
                      hight: 52.1,
                      background: const Color(0xffd0fd3e),
                      rad: 21,
                      isapper: false,
                      size: 15,
                      right: () {},
                      text: 'Sign in'),
                  const SizedBox(height: 8),
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
                    height: 30,
                  ),
                  const Text(
                    "Sign  in  with ",
                    style: TextStyle(
                        fontSize: 19.2,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
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
                  const SizedBox(height: 10),
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
                  ),
                  const SizedBox(height: 55),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
