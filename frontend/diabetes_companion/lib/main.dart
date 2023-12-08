import 'dart:async';

import 'package:diabetes_companion/core/constant/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '/core/constant/routes.dart';

import '/binding/initialbinding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'route.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', 'High Importance Notifications',
    description: 'this channel is used for importnc notification',
    importance: Importance.high,
    playSound: true);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up : ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'AIzaSyAh79VhvVYuo62dWcugeURffQlo30dEyk4',
      appId: '1:123653352461:web:dc7899ea9c17e7f4473944',
      messagingSenderId: '123653352461',
      projectId: 'diabetes-companion-944a8',
      storageBucket: 'diabetes-companion-944a8.appspot.com',
    ));
  } else {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(
        (message) => _firebaseMessagingBackgroundHandler(message));
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
  }
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
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? remoteNotification = message.notification;
      AndroidNotification? androidNotification = message.notification?.android;
      if (remoteNotification != null && androidNotification != null) {
        flutterLocalNotificationsPlugin.show(
          remoteNotification.hashCode,
          remoteNotification.title,
          remoteNotification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                channelDescription: channel.description,
                color: ColorApp.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher'),
          ),
        );
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published');
      RemoteNotification? remoteNotification = message.notification;
      AndroidNotification? androidNotification = message.notification?.android;
      if (remoteNotification != null && androidNotification != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(remoteNotification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(remoteNotification.body!)],
                  ),
                ),
              );
            });
      }
    });
    Timer(const Duration(seconds: 5), () {
      setState(() {
        Get.toNamed(RouteApp.login);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // LoacleController controller = Get.put(LoacleController());

    return GetMaterialApp(
      // translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Amiri',
      ),
      // locale: controller.language,
      title: 'Diabetec Companion',
      initialBinding: InitialBinding(),
      getPages: routes,
    );
  }
}
