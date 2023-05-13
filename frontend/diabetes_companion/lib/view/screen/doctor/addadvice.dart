import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../../../../core/constant/color.dart';
import '../../widget/buttonauth.dart';
import '../../widget/textfieldauth.dart';
import 'package:image_picker/image_picker.dart';

class AddAdvicePage extends StatefulWidget {
  const AddAdvicePage({super.key});

  @override
  State<AddAdvicePage> createState() => AddAdvicePageState();
}

class AddAdvicePageState extends State<AddAdvicePage> {
  TextEditingController dateController = TextEditingController();
  TextEditingController glocoseController = TextEditingController();

  @override
  void initState() {
    dateController.text = ""; //set the initial value of text field
    super.initState();
  }

  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text(
              'اختر صورة',
              style: TextStyle(fontSize: 25),
            ),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorApp.blue),
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.image),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'معرض الصور',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorApp.blue),
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.camera),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'الكاميرا',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: <Widget>[
        // Container(
        //   alignment: Alignment.center,
        //   child: const Image(
        //     image: AssetImage(ImageAsset.glucose),
        //     fit: BoxFit.cover,
        //     height: double.infinity,
        //     width: double.infinity,
        //   ),
        // ),
        Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'أضف نصيحة جديدة',
                    style: TextStyle(fontSize: 30, color: ColorApp.red),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldAuth(
                    // valid: (val) {},
                    lable: "النص",
                    passwordVisible: false,
                    type: TextInputType.number,
                    textEditingController: glocoseController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldAuth(
                    // valid: (val) {},
                    lable: "الوصف",
                    passwordVisible: false,
                    type: TextInputType.number,
                    textEditingController: glocoseController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: ColorApp.blue),
                    onPressed: () {
                      myAlert();
                    },
                    child: const Text(
                      'أضف صورة للنصيحة',
                      style: TextStyle(
                          fontFamily: 'Amiri',
                          color: ColorApp.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 25),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // if image not null show the image
                  // if image null show text
                  image != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              //to show image, you type like this.
                              File(image!.path),
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                            ),
                          ),
                        )
                      : const Text(
                          "لا يوجد صورة",
                          style: TextStyle(
                              fontSize: 20, color: ColorApp.lightblue),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 110),
                    child: ButtonAuth(
                      label: 'حفظ',
                      onPressedFun: () {},
                    ),
                  ),
                ]),
          ),
        ),
      ]),
    );
  }
}
