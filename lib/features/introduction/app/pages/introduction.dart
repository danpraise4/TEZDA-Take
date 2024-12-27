import 'package:fetch/core/extensions/number.extension.dart';
import 'package:fetch/core/helper/constants.dart';
import 'package:fetch/core/helper/enums.dart';
import 'package:fetch/core/theme/colors.dart';
import 'package:fetch/core/widget/button.dart';
import 'package:fetch/features/introduction/app/controller/introduction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// Choose sign up or login
class Introduction extends StatefulWidget {
  const Introduction({super.key});

  static const route = '/introduction';

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text("Introduction"),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Palette.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SvgPicture.asset(
                      '$iconPath/icon-logo.svg',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  15.height,
                  Text(
                    "Welcome to $appName",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Your shopping experience just got easier",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: KButton(
                    type: ButtonType.primary,
                    onPressed: () => IntroductionController.signUp(context),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Expanded(
                  child: KButton(
                    type: ButtonType.outline,
                    onPressed: () => IntroductionController.login(context),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "By signing up, you agree to our Terms of Service and\nPrivacy Policy.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
