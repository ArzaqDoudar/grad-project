import 'package:flutter/material.dart';
import '../constant/color.dart';

class CustomTextField extends StatelessWidget {
  final String lable;
  final Icon? icon;
  final String? hinttext;
  final TextEditingController? mycontroller;

  const CustomTextField(
      {super.key,
      required this.lable,
      this.icon,
      this.mycontroller,
      this.hinttext});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validator: validInput(),

      controller: mycontroller,
      decoration: InputDecoration(
        hintText: hinttext,
        label: Text(lable),
        focusColor: ColorApp.blue,
        // iconColor: ColorApp.primary,
        suffixIcon: icon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      // initialValue: 'email',
    );
  }
}
