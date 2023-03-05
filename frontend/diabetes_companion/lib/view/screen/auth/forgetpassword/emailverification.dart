import 'package:flutter/material.dart';
import '../../../../core/constant/routes.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,

        // backgroundColor: const Color.fromRGBO(92, 174, 225, 1),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              // child:  Image(
              //   image: Image.asset(ImageAsset.backgroundAuthImage),
              //   fit: BoxFit.cover,
              //   height: double.infinity,
              //   width: double.infinity,
              // ),
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
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox.fromSize(
                                  size: const Size(
                                      60, 60), // button width and height
                                ))),
                        const SizedBox(height: 5),

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

                        //email textfield
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
                        const SizedBox(height: 10),

                        //verify email button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: FilledButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                backgroundColor:
                                    const Color.fromRGBO(92, 174, 225, 1),
                                padding: const EdgeInsets.all(10),
                                textStyle: const TextStyle(fontSize: 20),
                                alignment: const Center().alignment),
                            onPressed: () {
                              //TODO
                              Navigator.pushNamed(
                                  context, RouteApp.forgetpasswordcode);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const VerificationCode()));
                            },
                            child: const SizedBox(
                              height: 30,
                              width: 500,
                              child: Text(
                                'تأكيد البريد الالكتروني',
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
                        const SizedBox(height: 45),
                      ],
                    ),
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
