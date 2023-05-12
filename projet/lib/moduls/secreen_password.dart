import 'package:flutter/material.dart';
import 'package:fitness/shared/components/componentsKhalida.dart';

class passwordView extends StatefulWidget {
  const passwordView({Key? key}) : super(key: key);

  @override
  State<passwordView> createState() => _passwordViewState();
}

class _passwordViewState extends State<passwordView> {
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/back.png"), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                      color: const Color(0xff1d1e1c),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
              const SizedBox(height: 26),
              Container(
                padding: const EdgeInsets.only(left: 32),
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.only(left: 34),
                child: const Text(
                  'Enter your informations below or ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                padding: const EdgeInsets.only(left: 34),
                child: const Text(
                  'Login with a other account ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Padding(
                padding: const EdgeInsets.all(19.0),
                child: Container(
                  width: 320,
                  height: 60,
                  padding: const EdgeInsets.only(left: 25),
                  decoration: BoxDecoration(
                      color: const Color(0xff424040),
                      borderRadius: BorderRadius.circular(25)),
                  child: const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.mail,
                          color: Color(0xff7e7e7e),
                        ),
                        hintText: '   E-mail',
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              Container(
                width: 300,
                padding: const EdgeInsets.only(left: 49),
                child: defaultButton(
                  hight: 50,
                  background: const Color(0xffd0fd3e),
                  rad: 24,
                  isapper: false,
                  size: 15,
                  right: () {},
                  text: 'Send',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
