import 'package:flutter/material.dart';
import '../../../../controller/patient/maincontrollers/addlogscontroller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/imageasset.dart';

class AlarmPage extends StatelessWidget {
  final AddLogsControllerImp controller;
  const AlarmPage({super.key, required this.controller});
  // final TextEditingController weightController = TextEditingController();
  // final TextEditingController fatsWeightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.medication_liquid_rounded,
                        color: ColorApp.blue,
                      ),
                    ),
                  ]),
                  Column(
                    children: const [
                      Text(
                        'منبه الدواء',
                        maxLines: 3,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ColorApp.blue,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Column(children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: ColorApp.red,
                      ),
                    ),
                  ]),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.calendar_month_rounded,
                        color: ColorApp.blue,
                      ),
                    ),
                  ]),
                  Column(
                    children: const [
                      Text(
                        'منبه المواعيد',
                        maxLines: 3,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ColorApp.blue,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Column(children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: ColorApp.red,
                      ),
                    ),
                  ]),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.water_drop_rounded,
                            color: ColorApp.blue,
                          ),
                        ),
                      ]),
                  Column(
                    children: const [
                      Text(
                        'منبه فحص السكري',
                        maxLines: 3,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ColorApp.blue,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Column(children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: ColorApp.red,
                      ),
                    ),
                  ]),
                ],
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: 300,
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: const Image(
                    image: AssetImage(ImageAsset.alarm),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
