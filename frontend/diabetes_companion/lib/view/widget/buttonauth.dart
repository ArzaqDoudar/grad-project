import '/core/constant/color.dart';
import 'package:flutter/material.dart';

class ButtonAuth extends StatelessWidget {
  final String label;
  final Color? color;
  final VoidCallback onPressedFun;

  const ButtonAuth(
      {super.key, required this.label, required this.onPressedFun, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: color ?? ColorApp.blue,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          textStyle: const TextStyle(fontSize: 24),
          alignment: const Center().alignment,
        ),
        onPressed: onPressedFun,
        child: Text(label),
      ),
    );
  }
}



//  ElevatedButton.styleFrom(
//           // minimumSize: const Size.fromHeight(30),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           backgroundColor: ColorApp.blue,
//           padding: const EdgeInsets.all(10),
//           textStyle: const TextStyle(fontSize: 20),
//           alignment: const Center().alignment,
//         ),