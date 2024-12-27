// ignore_for_file: use_build_context_synchronously

import 'package:fetch/core/storage/dispatch.dart';
import 'package:fetch/features/authentication/presentation/screens/login.dart';
import 'package:fetch/features/authentication/presentation/screens/register.dart';
import 'package:fetch/features/introduction/app/pages/introduction.dart';

import 'package:fetch/features/introduction/app/pages/onboard.dart';
import 'package:fetch/features/checkout/presentation/screens/dashboard.dart';
import 'package:flutter/material.dart';

class IntroductionController {
  BuildContext context;

  PageController onboardController = PageController();
  ValueNotifier<int> onboardIndex = ValueNotifier(0);

  IntroductionController(this.context);

  static pushToNext(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      bool isAuth = getUser != null;

      String target = isFirstTime()
          ? Onboard.route
          : isAuth
              ? Dashboard.route
              : Introduction.route;
      Navigator.pushNamed(context, target);
    });
  }

  void onChangeOnboard(int index) {
    onboardIndex.value = index;
  }

  static getStarted(BuildContext context) {
    Navigator.pushNamed(context, Introduction.route);
  }

  static signUp(BuildContext context) {
    Navigator.pushNamed(context, Register.route);
  }

  static login(BuildContext context) {
    Navigator.pushNamed(context, Login.route);
  }
}
