import 'package:fetch/core/helper/enums.dart';
import 'package:fetch/core/theme/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KInput extends StatefulWidget {
  const KInput({
    super.key,
    this.style = InputStyleType.border,
    required this.controller,
    required this.hint,
    this.onChanged,
    this.inputeType,
    this.filled,
    this.fillColor,
    this.canCancel,
    this.startfix,
    this.prefix,
    this.surfix,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final InputStyleType style;
  final String hint;

  final TextInputType? inputeType;

  final Widget? startfix;
  final Widget? prefix;
  final Widget? surfix;

  final bool? filled;
  final Color? fillColor;

  final bool isPassword;

  final bool? canCancel;

  final void Function(String)? onChanged;

  @override
  State<KInput> createState() => _KInputState();
}

class _KInputState extends State<KInput> {
  ValueNotifier<bool> hasContent = ValueNotifier(false);

  bool isVisible = true;

  // states
  @override
  void initState() {
    super.initState();
    if (widget.isPassword) {
      isVisible = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 55.h,
          child: Row(
            children: [
              if (widget.startfix != null) widget.startfix!,
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w800),
                  onChanged: (value) {
                    hasContent.value = value.isNotEmpty;
                    widget.onChanged?.call(value);
                  },
                  keyboardType: widget.inputeType,
                  onTapOutside: (_) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                  obscureText: widget.isPassword ? !isVisible : false,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    
                    hintText: widget.hint,
                    hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.primaryFixedDim),
                    prefixIcon: widget.prefix,
                    suffixIcon: widget.isPassword
                        ? GestureDetector(
                            onTap: () => setState(() => isVisible = !isVisible),
                            child: Icon(
                              isVisible
                                  ? FluentIcons.eye_off_32_regular
                                  : FluentIcons.eye_32_regular,
                              size: 20,
                            ),
                          )
                        : widget.canCancel == true
                            ? ValueListenableBuilder(
                                valueListenable: hasContent,
                                builder: (context, value, child) {
                                  return IconButton(
                                    onPressed: () => widget.controller.clear(),
                                    icon: Icon(
                                      Icons.cancel,
                                      size: 15,
                                      color: value
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondary
                                          : Theme.of(context)
                                              .colorScheme
                                              .primaryFixedDim
                                              .withOpacity(0.5),
                                    ),
                                  );
                                })
                            : widget.surfix,

                    filled: widget.filled,
                    fillColor: widget.fillColor,

                    //  border
                    enabledBorder: getBorder(),
                    focusedBorder: getBorder(isActive: true),
                    errorBorder: getBorder(isError: true),
                    disabledBorder: getBorder(),
                    focusedErrorBorder:
                        getBorder(isError: true, isActive: true),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  getBorder({
    bool isError = false,
    bool isActive = false,
  }) {
    if (widget.style == InputStyleType.none) {
      return BorderSide.none;
    }

    if (widget.style == InputStyleType.border) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: isError
              ? Colors.red
              : isActive
                  ? Palette.primary
                  : Colors.grey.withOpacity(0.4),
        ),
      );
    }

    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: isError
            ? Colors.red
            : isActive
                ? Palette.primary
                : Colors.grey,
      ),
    );
  }
}
