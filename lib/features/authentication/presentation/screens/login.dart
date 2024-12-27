import 'package:fetch/core/extensions/number.extension.dart';
import 'package:fetch/core/helper/enums.dart';
import 'package:fetch/core/theme/colors.dart';
import 'package:fetch/core/widget/appbar.dart';
import 'package:fetch/core/widget/input.dart';
import 'package:fetch/core/widget/loading.dart';
import 'package:fetch/features/authentication/presentation/controller/login.controller.dart';
import 'package:fetch/features/authentication/presentation/providers/auth_providers.dart';
import 'package:fetch/features/authentication/presentation/widgets/header.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  static const String route = "/login";

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  LoginController controller = LoginController();

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
                title: "Enter your  phone number",
                subTitle: "Please enter a valid phone number to continue",
              ),
              15.height,
              KInput(
                controller: controller.usernameController,
                style: InputStyleType.border,
                filled: true,
                inputeType: TextInputType.phone,
                fillColor: Palette.transparent,
                hint: "Enter username",
                // prefix: _countryUI(),
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
              const Spacer(),
              _bottomUI()
            ],
          ),
        ),
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
              onPressed: () => controller.login(context, ref),
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
