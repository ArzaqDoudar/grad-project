import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.color,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: endIcon
          ? Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.grey,
              ),
            )
          : null,
      trailing: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          size: 25,
          color: color??ColorApp.blue,
        ),
      ),
      title: Text(
        textAlign: TextAlign.right,
        title,
        style: const TextStyle(
          fontSize: 25,
          color: ColorApp.darkBlue
        ).apply(color: color),
      ),
    );
  }
}
