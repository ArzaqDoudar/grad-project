import '/core/constant/color.dart';
import 'package:flutter/material.dart';

import '../../core/constant/imageasset.dart';

class AdviceCard extends StatelessWidget {
  final key1 = GlobalKey();
  final String text;
  final String? image;
  AdviceCard({
    this.image,
    required this.text,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Card(
      key: key1,
      color: Colors.white,
      elevation: 8.0,
      borderOnForeground: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const Center(
                child: Text(
                  'نصيحة اليوم',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: ColorApp.darkBlue),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    text,
                    textDirection: TextDirection.rtl,
                    style:
                        const TextStyle(fontSize: 18, color: ColorApp.darkBlue),
                  ),
                  SizedBox(
                    width: screenSize.width * 0.18,
                    child: Image.asset(image ?? ImageAsset.adviceDefultImage),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
