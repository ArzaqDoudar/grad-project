import 'package:flutter/material.dart';
import '../../core/constant/color.dart';

class CarbsLine extends StatelessWidget {
  CarbsLine({
    super.key,
    required this.name,
    required this.weight,
    required this.carb,
    required this.weightDescription,
    required this.onPressedFun,
    required this.count,
  });
  final String name;
  final int weight;
  final int carb;
  final int count;
  final String weightDescription;
  final VoidCallback onPressedFun;
  int totalcarbs = 0;
  @override
  Widget build(BuildContext context) {
    totalcarbs = weight * count;

    return GestureDetector(
      onTap: onPressedFun,
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text(
                    weightDescription,
                    style: const TextStyle(fontSize: 16, color: ColorApp.grey),
                  ),
                  Text(
                    '$carb غم كاربوهيدرات',
                    style: const TextStyle(fontSize: 16, color: ColorApp.grey),
                  ),
                ],
              ),
              const SizedBox(
                width: 10, // TODO change to 30
              ),
              Text(
                totalcarbs != 0 ? '$count ($totalcarbs غم)' : '$count ',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10, // TODO change to 30
              ),
              // IconButton(
              //   onPressed: onPressedFun,
              //   icon: const Icon(
              //     Icons.close,
              //     color: ColorApp.grey,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
