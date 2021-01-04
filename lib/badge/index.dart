import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

///微标
class VooBadge extends StatelessWidget {
  final String child;
  final TextStyle style;
  final bool isPoint;
  final Color bgColor;

  VooBadge({
    this.child,
    this.isPoint = true,
    this.style = const TextStyle(fontSize: 10, color: Colors.white),
    this.bgColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    if (isPoint) {
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
          color: bgColor,
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(8)),
          constraints: BoxConstraints(
            minWidth: ScreenUtil().setWidth(32),
            minHeight: ScreenUtil().setWidth(32),
          ),
          child: Text('$child', style: style),
        ),
      );
    }
  }
}
