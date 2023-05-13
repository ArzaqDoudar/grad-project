import 'package:flutter/material.dart';
import '/core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'patientinfo.dart';

class Patient extends StatelessWidget {
  final String patientName;
  final num patientAge;
  final String diabetesType;

  const Patient({
    super.key,
    required this.patientName,
    required this.patientAge,
    required this.diabetesType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Align(
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  patientName,
                  maxLines: 3,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorApp.blue,
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: Row(
                    children: [
                      Text(
                        '$patientAge عام',
                        style:
                            const TextStyle(fontSize: 20, color: ColorApp.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(width: 15),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PatientInfo(
                                  diabetesType: 'سكري نوع أول',
                                  patientAge: 25,
                                  patientGender: 'ذكر',
                                  patientName: 'سكري سكري',
                                  patientPhone: 0568415330,
                                )));
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
