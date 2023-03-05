import '/core/constant/imageasset.dart';
import '/view/screen/auth/onboarding.dart';
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            child: SizedBox(
                              height: 30,
                              width: 100,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const OnBoarding(),
                                    ),
                                  );
                                },
                                child: const Text('Open route'),
                              ),
                              // IconButton(
                              //   iconSize: 75,
                              //   icon: const Icon(
                              //       Icons.arrow_circle_right_rounded),
                              //   color: const Color.fromRGBO(0, 90, 141, 1),
                              //   onPressed: () {
                              //     print('startup page');
                              //     // Navigator.push(
                              //     //   context,
                              //     //   MaterialPageRoute(
                              //     //     builder: (BuildContext context) =>
                              //     //         const MainScreen(),
                              //     //   ),
                              //     // );
                              //   },
                              // ),
                            ),
                          ),
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
