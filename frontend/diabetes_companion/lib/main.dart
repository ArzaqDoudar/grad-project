import 'package:diabetes_companion/view/screen/auth/startup.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LoacleController controller = Get.put(LoacleController());

    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      title: 'Diabetec Companion',
      theme: ThemeData(
        fontFamily: 'Amiri',
      ),
      // home: const HomeScreen(),
      home: const Startup(),
      routes: routes,
    );
  }
}
