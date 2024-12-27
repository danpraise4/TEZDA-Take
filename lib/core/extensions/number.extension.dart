// Extension for number
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

extension NumberExtension on num {
  Widget get width => SizedBox(
        width: toDouble().w,
      );
  Widget get height => SizedBox(
        height: toDouble().h,
      );

  EdgeInsets get insets {
    return EdgeInsets.all(toDouble());
  }


  BorderRadius get br {
    return BorderRadius.circular(toDouble());
  }
}

extension on int {
  formatMoney() {
    return NumberFormat("#,##0", "en_US").format(this);
  }
}




extension InsetsExtention on List<num> {
  EdgeInsets get insets {
    return switch (length) {
      1 => EdgeInsets.all(this[0].toDouble()),
      2 => EdgeInsets.symmetric(
          horizontal: this[0].toDouble(), vertical: this[1].toDouble()),
      4 => EdgeInsets.fromLTRB(this[0].toDouble(), this[1].toDouble(),
          this[2].toDouble(), this[3].toDouble()),
      _ => EdgeInsets.all(this[0].toDouble()),
    };
  }
}
