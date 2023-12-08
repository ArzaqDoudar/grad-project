import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class MessageLine extends StatelessWidget {
  const MessageLine({
    super.key,
    required this.text,
    required this.sender,
    required this.email,
    // this.receiver
  });
  final String? text;
  final String? email;
  final bool? sender;
  // final bool? receiver;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            sender == true ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            "$email",
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.only(
              bottomRight: sender == true
                  ? const Radius.circular(50)
                  : const Radius.circular(5),
              bottomLeft: sender == true
                  ? const Radius.circular(5)
                  : const Radius.circular(50),
              topRight: const Radius.circular(50),
              topLeft: const Radius.circular(50),
            ),
            // bottomRight: 5 ,topRight: 50, topLeft: 50 , bottomLeft :50
            color: sender == true ? ColorApp.blue : Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                '$text',
                style: TextStyle(
                    fontSize: 16,
                    color: sender == true ? Colors.white : Colors.blue[800]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
