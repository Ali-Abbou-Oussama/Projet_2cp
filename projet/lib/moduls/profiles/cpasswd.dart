import 'package:flutter/material.dart';

class pswd extends StatefulWidget {
  const pswd({Key? key}) : super(key: key);

  @override
  State<pswd> createState() => _pswdState();
}

class _pswdState extends State<pswd> {
  bool _isPasswordVisible0 = false;
  bool _isPasswordVisible1 = false;
  bool _isPasswordVisible2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/Splash.png"), fit: BoxFit.cover)),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 5, top: 10),
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                          color: const Color(0xff1d1e1c),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19.245473861694336,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 34),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  
                    const SizedBox(
                      height: 32,
                    ),
                    const Text(
                      'Enter current password',
                      style: TextStyle(
                        color: Color(0xffd0fd3e),
                        fontSize: 11.547284126281738,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 320,
                      height: 60,
                      padding: const EdgeInsets.only(left: 35),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 49, 46, 46),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 20, 20, 20)
                                .withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset:
                                const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              obscureText: !_isPasswordVisible0,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible0 = !_isPasswordVisible0;
                                });
                              },
                              icon: Icon(
                                _isPasswordVisible0
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: const Color(0xff7e7e7e),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    const Text(
                      'Enter new password',
                      style: TextStyle(
                        color: Color(0xffd0fd3e),
                        fontSize: 11.547284126281738,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 320,
                      height: 60,
                      padding: const EdgeInsets.only(left: 35),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 49, 46, 46),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 20, 20, 20)
                                .withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset:
                                const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              obscureText: !_isPasswordVisible1,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible1 = !_isPasswordVisible1;
                                });
                              },
                              icon: Icon(
                                _isPasswordVisible1
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: const Color(0xff7e7e7e),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    const Text(
                      'Confirm new password',
                      style: TextStyle(
                        color: Color(0xffd0fd3e),
                        fontSize: 11.547284126281738,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 320,
                      height: 60,
                      padding: const EdgeInsets.only(left: 35),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 49, 46, 46),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 20, 20, 20)
                                .withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset:
                                const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              obscureText: !_isPasswordVisible2,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible2 = !_isPasswordVisible2;
                                });
                              },
                              icon: Icon(
                                _isPasswordVisible2
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: const Color(0xff7e7e7e),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Color(0xffd0fd3e),
                                  fontSize: 17,
                                  fontFamily: 'WorkSans',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                  color: Color(0xffd0fd3e),
                                  fontSize: 17,
                                  fontFamily: 'WorkSans',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
