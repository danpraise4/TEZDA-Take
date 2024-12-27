// Setup PIN

import 'package:fetch/core/extensions/number.extension.dart';
import 'package:fetch/core/helper/constants.dart';
import 'package:fetch/core/helper/enums.dart';
import 'package:fetch/core/theme/colors.dart';
import 'package:fetch/core/widget/appbar.dart';
import 'package:fetch/core/widget/input.dart';
import 'package:fetch/core/widget/loading.dart';
import 'package:fetch/features/authentication/presentation/controller/setup.controller.dart';
import 'package:fetch/features/authentication/presentation/providers/auth_providers.dart';
import 'package:fetch/features/authentication/presentation/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class Setup extends ConsumerStatefulWidget {
  const Setup({super.key});

  static const String route = "/setup";

  @override
  ConsumerState<Setup> createState() => _SetupState();
}

class _SetupState extends ConsumerState<Setup> {
  SetupController controller = SetupController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.listener(ref);
    return Scaffold(
        appBar: KAppBar(
          onPop: () => Navigator.pop(context),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display entered numbers
              10.height,
              const HeaderText(
                title: "Enter your display name",
                subTitle: "Please enter a account display name",
              ),
              15.height,
              KInput(
                controller: controller.nameController,
                style: InputStyleType.border,
                filled: true,
                fillColor: Palette.transparent,
                inputeType: TextInputType.text,
                hint: "Enter your display name",
                canCancel: true,
              ),

              const Spacer(),
              _bottomUI()
            ],
          ),
        ));
  }

  Widget _bottomUI() {
    final state = ref.watch(authStateNotifierProvider);

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: [15, 10].insets,
      margin: [0, 15].insets,
      child: Row(
        children: [
          SvgPicture.asset('$iconPath/icon-key.svg', width: 30, height: 30),
          10.width,
          Expanded(
              child: Text(
            "NEVER share your PASSWORD with anyone to keep your account secure",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
          )),
          IconButton.filled(
              onPressed: () => controller.update(context, ref),
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
