import '/core/constant/color.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>["سكري نوع أول", "سكري نوع ثاني", "أخرى"];

class CustomDropdownMenu extends StatefulWidget {
  const CustomDropdownMenu({super.key});

  @override
  State<CustomDropdownMenu> createState() => CustomDropdownMenuState();
}

class CustomDropdownMenuState extends State<CustomDropdownMenu> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DropdownButtonFormField(
        items: list.map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  value,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ),
            );
          },
        ).toList(),
        style: const TextStyle(
          fontSize: 18,
          color: ColorApp.darkBlue,
        ),
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
              'نوع السكري',
              style: TextStyle(
                fontSize: 20,
                color: ColorApp.blue,
              ),
            ),
          ),
          iconColor: ColorApp.blue,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
      ),
    );

// items: <String>['One', 'Two', 'Free', 'Four']
//           .map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Directionality(
//               textDirection: TextDirection.rtl,
//               child: Text(
//                 value,
//                 textAlign: TextAlign.right,
//                 textDirection: TextDirection.rtl,
//               )),
//         );
//       }).toList(),

    // DropdownButton<String>(
    //   value: dropdownValue,
    //   items: list.map<DropdownMenuItem<String>>(
    //     (String value) {
    //       return DropdownMenuItem<String>(
    //         value: value,
    //         child: Text(value),
    //       );
    //     },
    //   ).toList(),
    //   style: const TextStyle(color: ColorApp.blue),
    //   // dropdownColor: ColorApp.red,
    //   dr
    //   // borderRadius: const BorderRadius.all(Radius.circular(12)),
    //   onChanged: (String? value) {
    //     setState(
    //       () {
    //         dropdownValue = value!;
    //       },
    //     );
    //   },
    // );
  }
}
