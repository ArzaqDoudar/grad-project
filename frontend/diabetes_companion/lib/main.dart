import 'dart:async';

import '/core/constant/routes.dart';
import '/view/screen/auth/onboarding.dart';

import '/binding/initialbinding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      // setState(() {
      Get.toNamed(RouteApp.login);
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    LoacleController controller = Get.put(LoacleController());

    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Amiri',
      ),
      locale: controller.language,
      title: 'Diabetec Companion',
      initialBinding: InitialBinding(),
      getPages: routes,
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     LoacleController controller = Get.put(LoacleController());

//     return GetMaterialApp(
//       translations: MyTranslation(),
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         fontFamily: 'Amiri',
//       ),
//       locale: controller.language,
//       title: 'Diabetec Companion',
//       initialBinding: InitialBinding(),
//       // home: const HomeScreen(),
//       // home: const Startup(),
//       // home: const TestPage(),
//       // home: const TestView(),
//       // routes: routes,
//       getPages: routes,
//     );
//   }
// }
