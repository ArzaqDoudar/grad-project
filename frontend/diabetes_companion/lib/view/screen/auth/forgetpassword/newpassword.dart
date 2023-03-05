import 'package:diabetes_companion/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

import '../../../widget/buttonauth.dart';
import '../login.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(92, 174, 225, 1),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: const Image(
                image: AssetImage(ImageAsset.backgroundAuthImage),
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Align(
                  alignment: Alignment.center,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              child: Text(
                                'هل نسيت كلمة السر؟',
                                style: TextStyle(
                                    fontFamily: 'Amiri',
                                    color: Color.fromRGBO(0, 90, 141, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                softWrap: true,
                              ),
                            ),
                          ),
                        ),

                        //new pass textfield
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromRGBO(92, 174, 225, 1),
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            child: const Padding(
                              padding: EdgeInsets.only(right: 20, left: 20),
                              child: TextField(
                                obscureText: false,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock_outline_rounded,
                                      color: Color.fromRGBO(0, 90, 141, 1),
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'كلمة السر الجديدة',
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromRGBO(0, 90, 141, 1),
                                    ),
                                    hintTextDirection: TextDirection.rtl),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        //new pass textfield
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromRGBO(92, 174, 225, 1),
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            child: const Padding(
                              padding: EdgeInsets.only(right: 20, left: 20),
                              child: TextField(
                                obscureText: false,
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
                                    hintTextDirection: TextDirection.rtl),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        //change pass button
                        const ButtonAuth(
                          label: 'تغيير كلمة السر ',
                        ),
                        const SizedBox(height: 45),
                      ]),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
