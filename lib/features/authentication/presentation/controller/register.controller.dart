import 'package:fetch/app.dart';
import 'package:fetch/core/helper/utils.dart';
import 'package:fetch/features/authentication/presentation/providers/auth_providers.dart';
import 'package:fetch/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:fetch/features/authentication/presentation/screens/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  ValueNotifier<bool> isLoading = ValueNotifier(false);

  void register(BuildContext context, WidgetRef ref) {
    ref.read(authStateNotifierProvider.notifier).registerUser(
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
        Checkout.navKey.currentState?.pushReplacementNamed(Setup.route);
      }
    });
  }
}
