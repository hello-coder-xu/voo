import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum VooBadgeTheme { point, number }

///微标
class VooBadge extends StatelessWidget {
  final String child;
  final TextStyle style;
  final VooBadgeTheme theme;
  final Color bgColor;

  VooBadge({
    this.child,
    this.theme,
    this.style,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    VooBadgeTheme tempTheme = theme ?? VooBadgeTheme.point;
    TextStyle tempTextStyle = style ?? TextStyle(fontSize: 22.sp, color: Colors.white);
    Color tempBgColor = bgColor ?? Colors.red;
    if (tempTheme == VooBadgeTheme.point) {
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
