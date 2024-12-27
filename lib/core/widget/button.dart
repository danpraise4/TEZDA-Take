import 'package:fetch/core/helper/enums.dart';
import 'package:flutter/material.dart';

class KButton extends StatelessWidget {
  const KButton(
      {super.key,
      required this.child,
      this.onPressed,
      this.type = ButtonType.primary,
      this.horizontalPadding,
      this.verticalPadding = 10,
      this.color});

  final double? horizontalPadding;
  final double? verticalPadding;

  final Color? color;

  final Widget child;
  final ButtonType type;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 10, vertical: verticalPadding ?? 10),
      child: type == ButtonType.outline
          ? OutlinedButton(
              onPressed: onPressed,
              // Border width
              style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
                    side: WidgetStateProperty.all(
                      BorderSide(
                        width: 2,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ),
              child: child,
            )
          : type == ButtonType.primary
              ? FilledButton(
                  onPressed: onPressed,
                  style: Theme.of(context).filledButtonTheme.style?.copyWith(
                      backgroundColor: WidgetStateProperty.all(color)),
                  child: child,
                )
              : TextButton(
                  onPressed: onPressed,
                  style: Theme.of(context).textButtonTheme.style,
                  child: child,
                ),
    );
  }
}
