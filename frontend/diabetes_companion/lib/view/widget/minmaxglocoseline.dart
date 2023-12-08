import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class MinMaxGlocoseLine extends StatelessWidget {
  final num min;
  final num avg;
  final num max;

  const MinMaxGlocoseLine({
    super.key,
    required this.min,
    required this.avg,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2.0,
      borderOnForeground: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'معدل السكر بالدم',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ColorApp.grey1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    '$min',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ColorApp.blue,
                    ),
                  ),
                  const Text(
                    'اقل قيمة',
                    style: TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                      color: ColorApp.grey,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '${avg}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ColorApp.blue,
                    ),
                  ),
                  const Text(
                    'المعدل',
                    style: TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                      color: ColorApp.grey,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '$max',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ColorApp.blue,
                    ),
                  ),
                  const Text(
                    'اعلى قيمة',
                    style: TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                      color: ColorApp.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
