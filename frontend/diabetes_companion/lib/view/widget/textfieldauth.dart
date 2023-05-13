import 'package:flutter/material.dart';
import '../../core/constant/color.dart';
// import '../../core/functions/validinput.dart';

class TextFieldAuth extends StatelessWidget {
  final String lable;
  final TextInputType? type;
  final Icon? icon;
  final bool? passwordVisible;
  final TextEditingController textEditingController;
  final String? Function(String?)? valid;
  final text = "";
  final String? value;
  const TextFieldAuth({
    super.key,
    required this.lable,
    this.type,
    this.icon,
    this.passwordVisible,
    required this.textEditingController,
    this.valid,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        // validator: valid,
        initialValue: value,
        controller: textEditingController,
        // onChanged: (value) => textEditingController.text = value,
        obscureText: passwordVisible ?? false,
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
              width: 2.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: ColorApp.blue,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: ColorApp.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: ColorApp.red,
              width: 2.5,
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
