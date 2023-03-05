import 'package:diabetes_companion/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: const Image(
                image: AssetImage(ImageAsset.signupImage),
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,

                        //email textfield
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(92, 174, 225, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Padding(
                                padding: EdgeInsets.only(right: 20, left: 20),
                                child: TextField(
                                  obscureText: false,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: Color.fromRGBO(0, 90, 141, 1),
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'البريد الالكتروني',
                                      hintStyle: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromRGBO(0, 90, 141, 1),
                                      ),
                                      hintTextDirection: TextDirection.rtl),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),

                          //password textfield
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(92, 174, 225, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Padding(
                                padding: EdgeInsets.only(right: 20, left: 20),
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock_outline_rounded,
                                      color: Color.fromRGBO(0, 90, 141, 1),
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'كلمة السر',
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromRGBO(0, 90, 141, 1),
                                    ),
                                    hintTextDirection: TextDirection.rtl,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),

                          //confirm password
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(92, 174, 225, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Padding(
                                padding: EdgeInsets.only(right: 20, left: 20),
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock_outline_rounded,
                                      color: Color.fromRGBO(0, 90, 141, 1),
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'تأكيد كلمة السر',
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromRGBO(0, 90, 141, 1),
                                    ),
                                    hintTextDirection: TextDirection.rtl,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),

                          //signup button
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: FilledButton(
                              style: ElevatedButton.styleFrom(
                                  // minimumSize: const Size.fromWidth(50), // NEW

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  backgroundColor:
                                      const Color.fromRGBO(92, 174, 225, 1),
                                  padding: const EdgeInsets.all(10),
                                  textStyle: const TextStyle(fontSize: 20),
                                  alignment: const Center().alignment),
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => const Main()));
                              },
                              child: const SizedBox(
                                height: 30,
                                width: 500,
                                child: Text(
                                  'انشاء حساب',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          //sign in
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  backgroundColor: Colors.transparent,
                                  padding: const EdgeInsets.all(10),
                                  textStyle: const TextStyle(fontSize: 20),
                                  alignment: const Center().alignment),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Login()));
                              },
                              child: const SizedBox(
                                child: Text(
                                  'تسجيل الدخول بدلًا من ذلك',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      decoration: TextDecoration.underline,
                                      color: Color.fromRGBO(2, 46, 87, 1)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 45),
                        ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
