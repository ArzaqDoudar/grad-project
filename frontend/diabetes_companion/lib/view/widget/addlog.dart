import '/core/constant/color.dart';
import 'package:flutter/material.dart';

class AddLog extends StatelessWidget {
  const AddLog({Key? key, required this.text, required this.icon})
      : super(key: key);
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          FilledButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                // elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                    side: const BorderSide(color: ColorApp.blue))),
            onPressed: () {},
            child: Center(
              child: Column(children: [
                const SizedBox(height: 10),
                Icon(icon, size: 25.0, color: ColorApp.blue),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontFamily: 'Amiri',
                    fontWeight: FontWeight.bold,
                    color: ColorApp.blue,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
