import 'package:fetch/core/helper/constants.dart';
import 'package:fetch/core/widget/styled_text.dart';
import 'package:fetch/features/introduction/app/controller/introduction.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  static const route = '/';

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  void initState() {
    super.initState();
    IntroductionController.pushToNext(context);
  }

  @override
  Widget build(BuildContext context) {
    // clearAll();
    return  Scaffold(
      body: Center(
        child: StyledText( text: "Welcome to <c>$appName" , style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),) ,
      ),
    );
  }
}