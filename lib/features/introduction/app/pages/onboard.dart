import 'package:fetch/core/widget/button.dart';
import 'package:fetch/features/introduction/app/controller/introduction.dart';
import 'package:fetch/features/introduction/app/widget/bars.widget.dart';
import 'package:fetch/features/introduction/app/widget/onboard.item.widget.dart';
import 'package:fetch/features/introduction/data/constants/constants.dart';
import 'package:flutter/material.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  static const route = '/onboard';

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {

 late IntroductionController controller;

 @override
  void initState() {
    super.initState();
    controller = IntroductionController(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: SafeArea(
        child: Column(
          children: [
            // Loading

            ValueListenableBuilder(
              valueListenable: controller.onboardIndex,
              builder: (context, value, child) => ProgressBar(
                width: 300,
                 duration: const Duration(seconds: 3),
                count: 3,
                index: value,
                onCompleted: () {},
              ),
            ),
            Expanded(
              child: PageView(
                controller: controller.onboardController,
                onPageChanged: controller.onChangeOnboard,
                children: onboardItems.map((e) => OnboardItem(item: e)).toList(),
              ),
            ),

            KButton(
              onPressed: () => IntroductionController.getStarted(context),
              child: const Text("Get Started")),
          ],
        ),
      ),
    );
  }
}
