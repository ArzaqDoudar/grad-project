import 'package:flutter/material.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../widget/profilemenu.dart';
import 'auth/login.dart';
import 'editprofile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                  image: AssetImage(ImageAsset.avatarPatient),
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
            // SizedBox(
            //   width: 200,
            //   child: ButtonAuth(
            //       label: "التعديل على الملف",
            //       //TODO
            //       onPressedFun: () {
            //         Navigator.pushNamed(context, RouteApp.mainscreen);
            //       }),
            // ),
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
            ProfileMenu(
              icon: Icons.settings,
              onPress: () {},
              title: 'الاعدادات',
            ),
            ProfileMenu(
              icon: Icons.info_outline,
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfile()));
              },
              title: 'المعلومات الشخصية',
            ),
            ProfileMenu(
              icon: Icons.bar_chart,
              onPress: () {},
              title: 'الاحصائيات',
            ),
            const Divider(
              color: Colors.blueGrey,
            ),
            ProfileMenu(
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


// import 'package:flutter/material.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       // bottomNavigationBar: Cu(),
//       body: Text(
//         'Profile',
//         style: TextStyle(fontSize: 20),
//       ),
//     );
//   }
// }
