import '/controller/firebase/chatcontroller.dart';
import '/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../widget/messageline.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    Get.put(ChatControllerImp());
    final screenwidth = MediaQuery.of(context).size.width;

    return GetBuilder<ChatControllerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: ColorApp.blue,
          title: Text(controller.secondName!),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('chatting')
                      .orderBy('time', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    List<MessageLine> messageWedgets = [];
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                    final messages = snapshot.data!.docs;
                    for (var message in messages) {
                      final messageSender = message.get('sender');
                      final messageReceiver = message.get('receiver');

                      if (messageSender == controller.email &&
                              messageReceiver == controller.secondEmail ||
                          messageSender == controller.secondEmail &&
                              messageReceiver == controller.email) {
                        final messageText = message.get('text');
                        final messageWedget = MessageLine(
                          email: messageSender,
                          text: messageText,
                          sender:
                              messageSender == controller.email ? true : false,
                        );
                        messageWedgets.add(messageWedget);
                      }
                    }

                    return Expanded(
                      child: ListView(
                        reverse: true,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        children: messageWedgets,
                      ),
                    );
                  }),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: ColorApp.blue,
                      width: 2,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextField(
                          controller: controller.messageTextField,
                          onChanged: (value) {
                            controller.messageTextData = value;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            hintText: 'اكتب الرسالة هنا ....',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed:
                          //  controller.send(),
                          () {
                        if (controller.messageTextData.isNotEmpty) {
                          print('msg = ');
                          print(controller.messageTextData);
                          print('email  = {$controller.email}');
                          print(controller.email);
                          print('receiver  = ');
                          print(controller.secondEmail);
                          _firestore.collection('chatting').add({
                            'sender': controller.email,
                            'receiver': controller.secondEmail,
                            'text': controller.messageTextData,
                            'time': FieldValue.serverTimestamp(),
                          });
                          controller.messageTextField.clear();
                          controller.messageTextData = '';
                        }
                      },
                      child: const Text(
                        'ارسل',
                        style: TextStyle(
                          color: ColorApp.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
