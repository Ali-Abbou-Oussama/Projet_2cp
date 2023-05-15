// ignore_for_file: camel_case_types

import 'package:fitness/moduls/login/login/login_screen.dart';
import 'package:fitness/moduls/login/sign%20up/cubit/cubit.dart';
import 'package:fitness/moduls/login/sign%20up/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/components/components.dart';
import '../authentification/Authentification 1/gender.dart';

class signupView extends StatefulWidget {
  const signupView({Key? key}) : super(key: key);

  @override
  State<signupView> createState() => _signupViewState();
}

var emailcontroller = TextEditingController();
var passwordcontroller = TextEditingController();
var usernamecontroller = TextEditingController();
var confirmpasswordcontroller = TextEditingController();
bool ispassword = false;
var formKey = GlobalKey<FormState>();
bool isValidTld(String email) {
  final List<String> validTlds = ['com', 'net', 'org', 'edu', 'gov'];
  final String tld = email.split('.').last;
  return validTlds.contains(tld);
}

var isValid = formKey.currentState!.validate();

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
      home: BlocProvider(
        create: (BuildContext context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, GetfitRegisterStates>(
          listener: (context, state) {
            if (state is GetfitCreateUserSuccessState) {}
          },
          builder: ((context, state) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  //width: 400,
                  //height: 810,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/Splash.png"),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 7.5),
                    child: Form(
                      key: formKey,
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
                              const SizedBox(width: 5),
                              defaultButton(
                                size: 14,
                                right: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const loginView1()));
                                },
                                text: 'Login',
                                isapper: false,
                                width: 88,
                                rad: 21,
                                background: Colors.transparent,
                              ),
                              // const Text(
                              //   "Login    ",
                              //   style: TextStyle(
                              //       fontSize: 16,
                              //       color: Colors.black,
                              //       fontWeight: FontWeight.w600),
                              // ),
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
                            validate: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'please enter a valid user name';
                              }
                              return null;
                            },
                            controller: usernamecontroller,
                            text: '   Enter your full name',
                            type: TextInputType.name,
                          ),
                          const SizedBox(height: 15),
                          Field(
                            validate: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@') ||
                                  !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
                                      .hasMatch(value) ||
                                  !isValidTld(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            controller: emailcontroller,
                            text: '    Enter an E-mail',
                            type: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 15),
                          Container(
                            width: 370.5,
                            height: 52.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextFormField(
                              obscureText: ispassword,
                              validator: (value) {
                                if (value == null || value.length < 6) {
                                  return 'password must be at least 6 characters';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              controller: passwordcontroller,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    ispassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      ispassword = !ispassword;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors
                                        .black, // Change border color here
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      25), // Match container border radius here
                                ),
                                labelText: '    password',
                                hintStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          // Field(
                          //   validate: (value) {
                          //     if (value == null || value.length < 6) {
                          //       return 'password must be at least 6 characters';
                          //     }
                          //     return null;
                          //   },
                          //   controller: passwordcontroller,
                          //   text: '   Enter a password ',
                          //   type: TextInputType.visiblePassword,
                          // ),
                          const SizedBox(height: 15),
                          Field(
                            validate: (value) {
                              if (value == null ||
                                  value != passwordcontroller.text) {
                                return 'passwords do not match. Please try again ';
                              } //confirmation de mot passe
                              return null;
                            },
                            controller: confirmpasswordcontroller,
                            text: '    confirm the password',
                            type: TextInputType.visiblePassword,
                          ),
                          const SizedBox(height: 25),
                          defaultButton(
                              hight: 52.1,
                              background: const Color(0xffd0fd3e),
                              rad: 21,
                              isapper: false,
                              size: 15,
                              right: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Authentification1(
                                                username:
                                                    usernamecontroller.text,
                                                email: emailcontroller.text,
                                                pasword:
                                                    passwordcontroller.text,
                                              )));
                                  // RegisterCubit.get(context).userRegister(
                                  //     username: usernamecontroller.text,
                                  //     email: emailcontroller.text,
                                  //     password: passwordcontroller.text);
                                }
                              },
                              text: 'Sign in'),
                          const SizedBox(height: 8),
                           Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Row(
                                children: const [
                                  SizedBox(
                                    width: 120,
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
                              Image.asset("images/google.png"),
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
                                "Already have an account?",
                                style: TextStyle(color: Color(0xffcfd7db)),
                              ),
                              TextButton(
                                  onPressed: (() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const loginView1()));
                                  }), //navigation to register screen////////////////////////////////////////////////
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Color(0xffd0fd3e),
                                        fontSize: 13.5),
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
          }),
        ),
      ),
    );
  }
}
