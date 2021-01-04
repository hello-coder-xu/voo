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
    TextStyle tempTextStyle = style ??
        TextStyle(fontSize: ScreenUtil().setSp(20), color: Colors.white);
    BorderRadius tempBorderRadius;
    EdgeInsets tempPadding = EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(12),
        vertical: ScreenUtil().setHeight(4));
    if (tempTheme == VooLabelTheme.rect) {
      tempBorderRadius =
          BorderRadius.all(Radius.circular(ScreenUtil().setWidth(4)));
    } else {
      tempBorderRadius = BorderRadius.only(
        topLeft: Radius.circular(ScreenUtil().setWidth(12)),
        bottomRight: Radius.circular(ScreenUtil().setWidth(12)),
        topRight: Radius.circular(ScreenUtil().setWidth(4)),
        bottomLeft: Radius.circular(ScreenUtil().setWidth(4)),
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
