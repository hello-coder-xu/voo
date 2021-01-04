import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

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
  }) ;

  @override
  Widget build(BuildContext context) {
    VooBadgeTheme tempTheme = theme ?? VooBadgeTheme.point;
    TextStyle tempTextStyle = style ??
        TextStyle(fontSize: ScreenUtil().setSp(22), color: Colors.white);
    Color tempBgColor = bgColor ?? Colors.red;
    if (tempTheme == VooBadgeTheme.point) {
      return ClipOval(
        child: Container(
          width: ScreenUtil().setWidth(16),
          height: ScreenUtil().setWidth(16),
          color: bgColor,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(ScreenUtil().setWidth(16)),
          right: Radius.circular(ScreenUtil().setWidth(16)),
        ),
        child: Container(
          alignment: Alignment.center,
          color: tempBgColor,
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(12)),
          constraints: BoxConstraints(
            minWidth: ScreenUtil().setWidth(32),
            minHeight: ScreenUtil().setWidth(32),
          ),
          child: Text('$child', style: tempTextStyle),
        ),
      );
    }
  }
}
