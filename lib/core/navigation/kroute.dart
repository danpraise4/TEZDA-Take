import 'package:flutter/material.dart';

class KRoute extends PageRouteBuilder {
  KRoute({
    required Widget child,
    super.settings,
    Duration? duration,
  }) : super(
          transitionsBuilder: transitionBuilder,
          transitionDuration: duration ?? const Duration(milliseconds: 200),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );
}

Widget transitionBuilder(context, animation, secondaryAnimation, child) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}