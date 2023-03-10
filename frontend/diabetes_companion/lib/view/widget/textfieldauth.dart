import 'package:flutter/material.dart';
import '../../core/constant/color.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

class TextFieldAuth extends StatelessWidget {
  final String lable;
  final TextInputType? type;
  final Icon? icon;
  final bool passwordVisible;
  // final TextEditingController textEditingController;
  // final bool isNotValidate;
  const TextFieldAuth({
    super.key,
    required this.lable,
    this.type,
    this.icon,
    required this.passwordVisible,
    // required this.textEditingController,
    // required this.isNotValidate
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        // controller: textEditingController,
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
