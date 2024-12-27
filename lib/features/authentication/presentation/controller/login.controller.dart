import 'package:fetch/app.dart';
import 'package:fetch/core/helper/utils.dart';
import 'package:fetch/features/authentication/presentation/providers/auth_providers.dart';
import 'package:fetch/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:fetch/features/checkout/presentation/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void login(BuildContext context, WidgetRef ref) {
    ref.read(authStateNotifierProvider.notifier).loginUser(
          usernameController.text,
          passwordController.text,
        );
  }

  void listener(WidgetRef ref) {
    ref.listen(authStateNotifierProvider, (previous, next) {
      if (next is Failure) {
        alert(next.exception.message);
        return;
      }
      if (next is Success) {
        Checkout.navKey.currentState?.pushReplacementNamed(Dashboard.route);
      }
    });
  }
}
