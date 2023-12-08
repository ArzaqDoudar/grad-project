import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../data/datasource/remote/patient/patient.dart';
import '../../view/widget/messageline.dart';

abstract class ChatController extends GetxController {
  send();
  // getFirestore();
  // getMessages(snapshot);
}

class ChatControllerImp extends ChatController {
  final _firestore = FirebaseFirestore.instance;
  PatientData patientData = PatientData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  List<MessageLine> messageWedgets = [];
  late TextEditingController messageTextField;

  String messageTextData = '';

  late String? id;
  late String? email;
  late String? secondEmail;
  late String? secondName;

  @override
  void onInit() {
    id = Get.arguments['id'];
    email = Get.arguments['email'];
    secondEmail = Get.arguments['secondEmail'];
    secondName = Get.arguments['secondName'];
    messageTextField = TextEditingController();
    print('on init chat controller');
    print('id $id');
    print('id $email');
    print('id $secondEmail');
    print('id $secondName');
    print('on init chat controller');
    update();
    super.onInit();
  }

  @override
  send() {
    if (messageTextData.isNotEmpty) {
      _firestore.collection('chatting').add({
        'sender': email,
        'receiver': secondEmail,
        'text': messageTextData,
        'time': FieldValue.serverTimestamp(),
      });
      messageTextField.clear();
      messageTextData = '';
    }
  }
}
