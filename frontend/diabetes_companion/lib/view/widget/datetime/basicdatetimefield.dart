import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:diabetes_companion/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/functions/datefunction.dart';

class BasicDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  final TextEditingController textEditingController;

  BasicDateTimeField({super.key, required this.textEditingController});
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DateTimeField(
        controller: textEditingController,
        decoration: InputDecoration(
          // errorText: isNotValidate ? 'enter data' : null,
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
              "تاريخ و وقت ",
              style: TextStyle(
                fontSize: 20,
                color: ColorApp.blue,
              ),
            ),
          ),
          // iconColor: ColorApp.blue,
          prefixIcon: const Icon(
            Icons.date_range_outlined,
            color: ColorApp.blue,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
        format: format,
        onChanged: (value) => {dateFunction(textEditingController)},
        onShowPicker: (context, currentValue) async {
          return await showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: ColorApp.blue, // <-- SEE HERE
                    onPrimary: ColorApp.white, // <-- SEE HERE
                    onSurface: ColorApp.darkBlue, // <-- SEE HERE
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      foregroundColor: ColorApp.blue, // button text color
                    ),
                  ),
                ),
                child: child!,
              );
            },
          ).then((DateTime? date) async {
            if (date != null) {
              final time = await showTimePicker(
                context: context,
                initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: ColorApp.red, // <-- SEE HERE
                        onPrimary: ColorApp.white, // <-- SEE HERE
                        onSurface: ColorApp.blue, // <-- SEE HERE
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          foregroundColor: ColorApp.blue, // button text color
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              return DateTimeField.combine(date, time);
            } else {
              return currentValue;
            }
          });
        },
      ),
    ]);
  }
}
