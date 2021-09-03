import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum VooBadgeStyle {
  point, // 点
  text, //文本
}

///微标
class VooBadge extends StatelessWidget {
  //显示文本  显示模式为text 有效
  final String? child;

  //文本字体样式 显示模式为text 有效
  final TextStyle? textStyle;

  //显示模式
  final VooBadgeStyle? style;

  //微标背景颜色
  final Color? bgColor;

  VooBadge({
    this.child,
    this.style,
    this.textStyle,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    VooBadgeStyle tempTheme = style ?? VooBadgeStyle.point;
    TextStyle tempTextStyle = textStyle ?? TextStyle(fontSize: 22.sp, color: Colors.white);
    Color tempBgColor = bgColor ?? Colors.red;
    if (tempTheme == VooBadgeStyle.point) {
      return ClipOval(
        child: Container(
          width: 16.w,
          height: 16.w,
          color: bgColor,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(16.w),
          right: Radius.circular(16.w),
        ),
        child: Container(
          alignment: Alignment.center,
          color: tempBgColor,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          constraints: BoxConstraints(
            minWidth: 32.w,
            minHeight: 32.w,
          ),
          child: Text('$child', style: tempTextStyle),
        ),
      );
    }
  }
}
