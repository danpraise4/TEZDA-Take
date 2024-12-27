import 'package:fetch/core/extensions/number.extension.dart';
import 'package:fetch/core/helper/enums.dart';
import 'package:fetch/core/theme/colors.dart';
import 'package:fetch/core/widget/appbar.dart';
import 'package:fetch/core/widget/input.dart';
import 'package:fetch/core/widget/loading.dart';
import 'package:fetch/features/authentication/presentation/controller/register.controller.dart';
import 'package:fetch/features/authentication/presentation/providers/auth_providers.dart';
import 'package:fetch/features/authentication/presentation/widgets/header.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends ConsumerStatefulWidget {
  const Register({super.key});

  static const String route = "/register";

  @override
  ConsumerState<Register> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  final RegisterController controller = RegisterController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.listener(ref);
    return Scaffold(
      appBar: KAppBar(
        onPop: () => Navigator.pop(context),
        alignment: KAlignment.end,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              10.height,
              const HeaderText(
                title: "Create your checkout account",
                subTitle: "Please enter your username and password to continue",
              ),
              15.height,
              KInput(
                controller: controller.usernameController,
                style: InputStyleType.border,
                filled: true,
                fillColor: Palette.transparent,
                inputeType: TextInputType.text,
                hint: "Enter your username",
                canCancel: true,
              ),
              15.height,
              KInput(
                controller: controller.passwordController,
                style: InputStyleType.border,
                filled: true,
                fillColor: Palette.transparent,
                inputeType: TextInputType.visiblePassword,
                isPassword: true,
                hint: "Secured password",
                canCancel: true,
              ),
              5.height,
              _referralUI(),
              const Spacer(),
              _bottomUI()
            ],
          ),
        ),
      ),
    );
  }

  Widget _referralUI() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: [15, 10].insets,
      margin: [0, 15].insets,
      decoration: BoxDecoration(
        color:
            Theme.of(context).colorScheme.surfaceContainerHigh.withOpacity(0.5),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: 'Have a referral code?',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 13.sp,
                  ),
              children: [
                TextSpan(
                    text: ' Use here ',
                    style: TextStyle(
                      color: Palette.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 13.sp,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {}),
              ],
            ),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: 13.sp,
          )
        ],
      ),
    );
  }

  Widget _bottomUI() {
    final state = ref.watch(authStateNotifierProvider);

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: [15, 10].insets,
      margin: [0, 15].insets,
      child: Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                text: 'By continuing, you agree to our',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 12.sp,
                    ),
                children: [
                  TextSpan(
                      text: ' Terms & Conditions ',
                      style: const TextStyle(
                        color: Palette.primary,
                        fontWeight: FontWeight.w700,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
                  const TextSpan(
                    text: ' and ',
                  ),
                  TextSpan(
                      text: ' Privacy Policy ',
                      style: const TextStyle(
                        color: Palette.primary,
                        fontWeight: FontWeight.w700,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
                ],
              ),
            ),
          ),
          IconButton.filled(
              onPressed: () => controller.register(context, ref),
              style: Theme.of(context).iconButtonTheme.style?.copyWith(),
              icon: state.maybeMap(
                loading: (_) => kLoading(),
                orElse: () => const Icon(Icons.arrow_forward_outlined),
              ))
        ],
      ),
    );
  }
}
