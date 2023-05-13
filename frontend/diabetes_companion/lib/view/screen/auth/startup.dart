import 'package:diabetes_companion/core/constant/routes.dart';
import 'package:get/get.dart';

import '/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class Startup extends StatelessWidget {
  const Startup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: const Image(
                image: AssetImage(ImageAsset.getstartedImage),
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
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
                                  'أهلاً بك في تطبيق \n رفيق السكري',
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
                          ElevatedButton(
                              onPressed: () {
                                Get.toNamed(RouteApp.login);
                              },
                              child: const Text('To Login')),
                          // SizedBox(
                          //   height: 50,
                          //   width: 100,
                          //   child: ElevatedButton(
                          //     style: ButtonStyle(
                          //         backgroundColor: MaterialStateProperty.all(
                          //             ColorApp.lightblue)),
                          //     onPressed: () {
                          //       Get.offNamed(RouteApp.login);
                          //       // Navigator.push(
                          //       //   context,
                          //       //   MaterialPageRoute(
                          //       //     builder: (BuildContext context) =>
                          //       //         const OnBoarding(),
                          //       //   ),
                          //       // );
                          //     },
                          //     child: Row(
                          //       mainAxisSize: MainAxisSize.min,
                          //       children: const [
                          //         Text(
                          //           'ابدأ',
                          //           style: TextStyle(
                          //             fontSize: 24,
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           width: 10,
                          //         ),
                          //         Icon(
                          //           Icons.arrow_forward,
                          //           size: 24.0,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(height: 60),
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
