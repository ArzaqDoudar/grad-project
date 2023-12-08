import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

import '../../../core/functions/datefunction.dart';
import '/core/constant/color.dart';

class BasicTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");

  final TextEditingController controller;
  BasicTimeField({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return
        //Card(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(80),
        // ),
        // elevation: 2,
        // child:
        Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Container(
        // padding: EdgeInsets.all(15),
        // height: 150,
        child: Center(
          child: TextField(
            controller: controller, //editing controller of this TextField
            onChanged: (value) => {dateFunction(controller)},

            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: ColorApp.blue,
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: ColorApp.blue,
                ),
              ),
              label: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "اختر الوقت",
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorApp.blue,
                  ),
                ),
              ),
              // iconColor: ColorApp.blue,
              // prefixIcon: const Icon(
              //   Icons.date_range_outlined,
              //   color: ColorApp.blue,
              // ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            ),
            readOnly:
                true, //set it true, so that user will not able to edit text
            onTap: () async {
              TimeOfDay? pickedTime = await showTimePicker(
                initialTime: TimeOfDay.now(),
                context: context,
              );

              if (pickedTime != null) {
                print(pickedTime.format(context)); //output 10:51 PM
                DateTime parsedTime = DateFormat.jm()
                    .parse(pickedTime.format(context).toString());
                //converting to DateTime so that we can further format on different pattern.
                print(parsedTime); //output 1970-01-01 22:53:00.000
                String formattedTime = DateFormat('HH:mm').format(parsedTime);
                print(formattedTime); //output 14:59:00
                //DateFormat() is from intl package, you can format the time on any pattern you need.

                // setState(() {
                controller.text = formattedTime;

                //set the value of text field.
                // });
              } else {
                print("Time is not selected");
              }
            },
          ),
        ),
      ),
    );
    //   ),
    // );
  }
}
