import 'package:flutter/material.dart';
import '../../core/constant/imageasset.dart';
import '/core/constant/color.dart';
import 'patientinformation.dart';

class PatientWidget extends StatelessWidget {
  final String patientName;
  final num patientAge;
  final String diabetesType;
  final String gender;
  final VoidCallback onPressedFun;

  const PatientWidget({
    super.key,
    required this.patientName,
    required this.patientAge,
    required this.diabetesType,
    required this.gender,
    required this.onPressedFun,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // width: double.infinity,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              foregroundImage: AssetImage(gender == 'female'
                  ? ImageAsset.avatarPatientfemale
                  : ImageAsset.avatarPatient),
              radius: 39,
            ),
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
                const SizedBox(height: 5),
                Center(
                  child: Text(
                    diabetesType == '1'
                        ? 'سكري نوع أول'
                        : diabetesType == '2'
                            ? 'سكري نوع ثاني'
                            : "غير معرف",
                    style: const TextStyle(fontSize: 20, color: ColorApp.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: Text(
                    patientAge == 0 ? "غير معرف" : '$patientAge عام',
                    style: const TextStyle(fontSize: 20, color: ColorApp.grey),
                    textAlign: TextAlign.center,
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
                  onPressed: onPressedFun,
                  // {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const PatientInfo(
                  //               diabetesType: 'سكري نوع أول',
                  //               patientAge: 25,
                  //               patientGender: 'ذكر',
                  //               patientName: 'سكري سكري',
                  //               patientPhone: 0568415330,
                  //             )));
                  // },
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
