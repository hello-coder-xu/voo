import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum VooLabelStyle { rect, half_circle }

///标签视图
class VooLabel extends StatelessWidget {
  //内容文本
  final String value;

  //背景颜色
  final Color bgColor;

  //字体样式
  final TextStyle textStyle;

  //显示模式
  final VooLabelStyle style;

  VooLabel({
    @required this.value,
    this.bgColor,
    this.textStyle,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    VooLabelStyle tempTheme = style ?? VooLabelStyle.rect;
    Color tempBgColor = bgColor ?? const Color(0xff333333);
    TextStyle tempTextStyle = textStyle ?? TextStyle(fontSize: 20.sp, color: Colors.white);
    BorderRadius tempBorderRadius;
    EdgeInsets tempPadding = EdgeInsets.symmetric(
      horizontal: 12.w,
      vertical: 4.h,
    );
    if (tempTheme == VooLabelStyle.rect) {
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
