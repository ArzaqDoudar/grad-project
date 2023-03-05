import 'package:flutter/material.dart';
import 'core/constant/routes.dart';
import 'view/screen/auth/forgetpassword/emailverification.dart';
import 'view/screen/auth/forgetpassword/verificationcode.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/auth/onboarding.dart';
import 'view/screen/auth/signup.dart';
import 'view/screen/auth/startup.dart';
import 'view/screen/mainscreen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  RouteApp.startup: (context) => const Startup(),
  RouteApp.onboarding: (context) => const OnBoarding(),
  RouteApp.login: (context) => const Login(),
  RouteApp.signup: (context) => const Signup(),
  RouteApp.forgetpasswordemail: (context) => const EmailVerification(),
  RouteApp.forgetpasswordcode: (context) => const VerificationCode(),
  RouteApp.newpassword: (context) => const MainScreen(),
  RouteApp.mainscreen: (context) => const MainScreen(),
};
