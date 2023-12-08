// HistoryLine

import 'package:flutter/material.dart';
// HistoryLine
// Color
// data
// time
// date

import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';

class HistoryLine extends StatelessWidget {
  const HistoryLine({
    super.key,
    required this.color,
    required this.data,
    required this.time,
    required this.date,
  });
  final int data;
  final Color color;
  final String time;
  final String date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.label,
              color: color,
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Text(
                  '$data',
                  style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: ColorApp.darkBlue),
                ),
                const Text(
                  'ملغم/دل',
                  style: TextStyle(fontSize: 14, color: ColorApp.darkBlue),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              // width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorApp.grey),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
