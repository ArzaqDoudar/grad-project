import 'package:diabetes_companion/test.dart';

import '/binding/initialbinding.dart';

import '/view/screen/auth/startup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'route.dart';
// import 'package:http/http.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
      // home: const HomeScreen(),
      // home: const Startup(),
      home: const Test(),
      routes: routes,
    );
  }
}
