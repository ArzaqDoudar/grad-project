import '/core/constant/routes.dart';
import 'package:flutter/foundation.dart';
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
                image: (kIsWeb == true)
                    ? AssetImage(ImageAsset.getstartedImageWeb)
                    : AssetImage(ImageAsset.getstartedImage),
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
