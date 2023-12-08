// HistoryLine

import 'package:flutter/material.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';

class InsulinLine extends StatelessWidget {
  InsulinLine({
    super.key,
    required this.color,
    required this.doseUnits,
    required this.time,
    required this.date,
  });
  final double doseUnits;
  final Color color;
  final String time;
  final String date;

  String amPm = 'AM';
  int hour = 0;
  int min = 0;

  @override
  Widget build(BuildContext context) {
    List<String> timedata = time.split(':');
    hour = int.parse(timedata[0]);
    min = int.parse(timedata[1]);
    if (hour > 12) {
      hour = hour - 12;
      amPm = 'PM';
    }
    return GestureDetector(
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(
              width: 10,
            ),
            // Icon(
            //   Icons.label,
            //   color: color,
            // ),
            const Image(
              image: AssetImage(ImageAsset.insulinIcon),
              width: 50,
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Text(
                  '$doseUnits',
                  style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: ColorApp.darkBlue),
                ),
                const Text(
                  'وحدة ',
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
                    '$hour:$min $amPm',
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
