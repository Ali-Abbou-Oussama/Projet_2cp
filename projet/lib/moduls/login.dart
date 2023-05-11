// ignore_for_file: sort_child_properties_last, sized_box_for_whitespace, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

class loginView extends StatefulWidget {
  const loginView({Key? key}) : super(key: key);

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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
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
                    Text(
                      "Sign up    ",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(21)),
                      height: 32,
                      width: 88,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21.0),
                            )),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xffd0fd3e))),
                        onPressed: () {
                          // Login button pressed
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 20,
                              letterSpacing: 0.38,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
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
                Container(
                  width: 370.5,
                  height: 52.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '   E-mail',
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 370.5,
                  height: 52.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '    Password',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Container(
                  width: 370.5,
                  height: 52.9,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffd0fd3e))),
                    onPressed: () {
                      // Login button pressed
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 20,
                          letterSpacing: 0.38,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
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
                      children: const [
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
                    Image.asset("images/gog.png"),
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
                            null, //navigation to register screen////////////////////////////////////////////////
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
    );
  }
}
    
      /* decoration: 
        */
 
