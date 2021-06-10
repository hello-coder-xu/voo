import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum VooLabelTheme { rect, half_circle }

///标签视图
class VooLabel extends StatelessWidget {
  final String value;
  final Color bgColor;
  final TextStyle style;
  final VooLabelTheme theme;

  VooLabel({
    @required this.value,
    this.bgColor,
    this.style,
    this.theme,
  });

  @override
  Widget build(BuildContext context) {
    VooLabelTheme tempTheme = theme ?? VooLabelTheme.rect;
    Color tempBgColor = bgColor ?? const Color(0xff333333);
    TextStyle tempTextStyle = style ?? TextStyle(fontSize: 20.sp, color: Colors.white);
    BorderRadius tempBorderRadius;
    EdgeInsets tempPadding = EdgeInsets.symmetric(
      horizontal: 12.w,
      vertical: 4.h,
    );
    if (tempTheme == VooLabelTheme.rect) {
      tempBorderRadius = BorderRadius.all(Radius.circular(4.w));
    } else {
      tempBorderRadius = BorderRadius.only(
        topLeft: Radius.circular(12.w),
        bottomRight: Radius.circular(12.w),
        topRight: Radius.circular(4.w),
        bottomLeft: Radius.circular(4.w),
      );
    }
    return Container(
      padding: tempPadding,
      decoration: BoxDecoration(
        color: tempBgColor,
        borderRadius: tempBorderRadius,
      ),
      child: Text(value, style: tempTextStyle),
    );
  }
}
