// ignore_for_file: camel_case_types

import 'package:fitness/moduls/login/cubit/cubit.dart';
import 'package:fitness/moduls/login/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/components.dart';
import '../sign up/secreen_signup.dart';

class loginView1 extends StatefulWidget {
  const loginView1({Key? key}) : super(key: key);

  @override
  State<loginView1> createState() => _loginViewState();
}

class _loginViewState extends State<loginView1> {
  var visable = const Icon(
    Icons.visibility,
    color: Color(0xff4c5166),
  );
  var visableoff = const Icon(
    Icons.visibility_off,
    color: Color(0xff4c5166),
  );
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool ispassword = true;

  // void _submit() {
  //   final isValid = formKey.currentState!.validate();
  //   if (isValid) {
  //     formKey.currentState!.save();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, GetfitLoginStates>(
          listener: ((context, state) {
            if (state is GetfitLoginErrorState) {
              showToast(
                text: state.error,
                state: ToasStates.EROOR,
              );
            }
          }),
          builder: (context, state) {
            return Expanded(
              child: Scaffold(
                body: Center(
                  child: SingleChildScrollView(
                    child: Container(
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
                              const SizedBox(
                                height: 32,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  defaultButton(
                                      size: 14,
                                      right: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const signupView()));
                                      },
                                      text: 'Sign Up',
                                      isapper: false,
                                      width: 88,
                                      rad: 21,
                                      background: Colors.transparent),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  // Text(
                                  //   "Sign up    ",
                                  //   style: TextStyle(
                                  //       fontSize: 16,
                                  //       color: Colors.black,
                                  //       fontWeight: FontWeight.w600),
                                  // ),
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
                                controller: emailcontroller,
                                type: TextInputType.emailAddress,
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
                                text: '   E-mail',
                              ),
                              const SizedBox(height: 20),
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
                              //     ispasword: ispassword,
                              //     suffix: ispassword
                              //         ? Icons.visibility
                              //         : Icons.visibility_off,
                              //     controller: passwordcontroller,
                              //     suffixpressed: () {
                              //       setState(() {
                              //         ispassword = !ispassword;
                              //       });
                              //     },
                              //     type: TextInputType.visiblePassword,
                              //     validate: (value) {
                              //       if (value == null || value.length < 6) {
                              //         return 'password must be at least 6 characters';
                              //       }
                              //       return null;
                              //     },
                              //     text: '    pasword'),
                              const SizedBox(height: 35),
                              defaultButton(
                                  hight: 52.1,
                                  background: const Color(0xffd0fd3e),
                                  rad: 21,
                                  isapper: false,
                                  size: 15,
                                  right: (() {
                                    if (formKey.currentState!.validate()) {
                                      LoginCubit.get(context).userLogin(
                                          email: emailcontroller.text,
                                          password: passwordcontroller.text);
                                    }
                                  }),
                                  text: 'Login'),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        width: 140,
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
                                        width: 145,
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
                                height: 25,
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
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    "Don't have an account ?",
                                    style: TextStyle(color: Color(0xffcfd7db)),
                                  ),
                                  TextButton(
                                      onPressed: (() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const signupView()));
                                      }), //navigation to register screen////////////////////////////////////////////////
                                      child: const Text(
                                        "Sing Up",
                                        style: TextStyle(
                                            color: Color(0xffd0fd3e),
                                            fontSize: 13.5),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
