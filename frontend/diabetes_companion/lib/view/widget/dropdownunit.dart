import '/core/constant/color.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>["غم", "ملغم", "مللتر","ملغم / مللتر"];

class CustomDropdownMenuUnit extends StatefulWidget {
  const CustomDropdownMenuUnit({super.key});

  @override
  State<CustomDropdownMenuUnit> createState() => CustomDropdownMenuUnitState();
}

class CustomDropdownMenuUnitState extends State<CustomDropdownMenuUnit> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DropdownButtonFormField(
        dropdownColor: ColorApp.white,
        borderRadius: BorderRadius.circular(12),
        isExpanded: true,
        items: list.map<DropdownMenuItem<String>>(
          (String value) {
            return 
            DropdownMenuItem<String>(
              value: value,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  value,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(color: ColorApp.blue),
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
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: ColorApp.blue,
              width: 1.5,
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
              'الوحدة',
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
  }
}
