import 'package:flutter/material.dart';

import '../../core/constant/color.dart';
import '../screen/auth/forgetpassword/newpassword.dart';

class ButtonAuth extends StatelessWidget {
  // final void fun();
  final String label;
  const ButtonAuth({
    super.key,
    // required this.fun,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: ElevatedButton(
        // style: ElevatedButton(style: ButtonStyle()),
        // onPressed: fun,
        onPressed: () {
          // Navigator.pushNamed(context, '/Login');\
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewPassword()));
        },
        child: Text(label),
      ),
    );
  }
}
// () {
//           // Navigator.pushNamed(context, '/Login');\
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) =>
//                       const NewPassword()));
//         }





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