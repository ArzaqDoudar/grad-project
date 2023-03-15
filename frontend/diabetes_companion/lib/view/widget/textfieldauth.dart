import 'package:flutter/material.dart';
import '../../core/constant/color.dart';
import '../../core/functions/validinput.dart';

class TextFieldAuth extends StatelessWidget {
  final String lable;
  final TextInputType? type;
  final Icon? icon;
  final bool passwordVisible;
  final TextEditingController textEditingController;

  const TextFieldAuth({
    super.key,
    required this.lable,
    this.type,
    this.icon,
    required this.passwordVisible,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        // validator: validInput(textEditingController.text,
        //     type.toString()), // TODO check if this is working
        controller: textEditingController,
        obscureText: passwordVisible,
        style: const TextStyle(
          fontSize: 20,
          color: ColorApp.darkBlue,
        ),
        textDirection: TextDirection.rtl,
        keyboardType: type,
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
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              lable,
              style: const TextStyle(
                fontSize: 20,
                color: ColorApp.blue,
              ),
            ),
          ),
          iconColor: ColorApp.blue,
          suffixIcon: icon,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
      ),
    );
  }
}
