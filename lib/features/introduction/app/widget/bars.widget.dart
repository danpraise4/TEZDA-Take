import 'package:fetch/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {

  final double width;
  final Duration duration;
  final int count;
  final int index;
  final Function() onCompleted;

  const ProgressBar({super.key, required this.width, required this.duration, required this.count, required this.index, required this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        children: List.generate(count, (index) => Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: index <= this.index ? Palette.primary : Palette.primary.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 7,
          ),
        )),
      ),
    );
  }
}