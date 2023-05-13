import 'package:flutter/material.dart';
import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/imageasset.dart';
import '../../../widget/profilemenu.dart';
import '../../auth/login.dart';
import 'editprofile.dart';

class ProfilePageDoctor extends StatelessWidget {
  const ProfilePageDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const Image(
                  image: NetworkImage(ImageAsset.avatarDoctor),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "فرح طوقان",
              style: TextStyle(fontSize: 35, color: ColorApp.darkBlue),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              color: Colors.blueGrey,
            ),
            const SizedBox(
              height: 10,
            ),

            //Menu

            GeneralMenu(
              icon: Icons.person,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfileDoctor()));
              },
              title: 'المعلومات الشخصية',
            ),
            GeneralMenu(
              icon: Icons.settings,
              onPress: () {},
              title: 'الاعدادات',
            ),
            const Divider(
              color: Colors.blueGrey,
            ),
            GeneralMenu(
              endIcon: false,
              icon: Icons.logout,
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              title: 'تسجيل الخروج',
              color: ColorApp.red,
            ),
          ],
        ),
      ),
    ));
  }
}
