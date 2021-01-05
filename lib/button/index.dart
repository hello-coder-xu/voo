import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

enum VooButtonTheme { normal, accent, capsule }

enum VooButtonSize { large, small, mini }

///按钮视图
class VooButton extends StatelessWidget {
  final String child;
  final TextStyle textStyle;
  final Color bgColor;
  final VooButtonTheme theme;
  final VooButtonSize size;
  final double elevation;
  final VoidCallback onPressed;

  VooButton({
    @required this.child,
    this.textStyle,
    this.bgColor,
    this.theme = VooButtonTheme.normal,
    this.size = VooButtonSize.large,
    this.elevation = 0.0,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    ShapeBorder shapeBorder;
    TextStyle tempTextStyle;
    Color tempBgColor = bgColor ?? Color(0xff25c489);
    if (onPressed == null) {
      tempBgColor = tempBgColor.withOpacity(0.7);
    }
    switch (theme) {
      case VooButtonTheme.normal:
        shapeBorder = RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(ScreenUtil().setWidth(10))),
        );
        tempTextStyle = textStyle ??
            TextStyle(fontSize: getTextFontSize(), color: Colors.white);
        return Container(
          constraints: getButtonConstraints(),
          child: ElevatedButton(
            style: ButtonStyle(
              shape: ButtonStyleButton.allOrNull(shapeBorder),
              backgroundColor: ButtonStyleButton.allOrNull(tempBgColor),
              elevation: ButtonStyleButton.allOrNull(elevation),
            ),
            child: Text(child, style: tempTextStyle),
            onPressed: onPressed,
          ),
        );
      case VooButtonTheme.accent:
        shapeBorder = RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(ScreenUtil().setWidth(10))),
        );
        tempTextStyle = textStyle ??
            TextStyle(fontSize: getTextFontSize(), color: tempBgColor);
        return Container(
          constraints: getButtonConstraints(),
          child: OutlineButton(
            child: Text(child, style: tempTextStyle),
            borderSide: BorderSide(color: tempBgColor, width: 1),
            shape: shapeBorder,
            disabledBorderColor: tempBgColor,
            onPressed: onPressed,
          ),
        );
      case VooButtonTheme.capsule: //胶囊类型
        shapeBorder = RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(27)),
        );
        tempTextStyle = textStyle ??
            TextStyle(fontSize: getTextFontSize(), color: Colors.white);
        return Container(
          constraints: getButtonConstraints(),
          child: ElevatedButton(
            style: ButtonStyle(
              shape: ButtonStyleButton.allOrNull(shapeBorder),
              backgroundColor: ButtonStyleButton.allOrNull(tempBgColor),
              elevation: ButtonStyleButton.allOrNull(elevation),
            ),
            child: Text(child, style: tempTextStyle),
            onPressed: onPressed,
          ),
        );
      default:
        return SizedBox.shrink();
    }
  }

  BoxConstraints getButtonConstraints() {
    BoxConstraints boxConstraints = BoxConstraints(
      minWidth: ScreenUtil().setWidth(152),
      minHeight: ScreenUtil().setWidth(54),
    );
    switch (size) {
      case VooButtonSize.large:
        boxConstraints = boxConstraints = BoxConstraints(
          minWidth: ScreenUtil().setWidth(686),
          minHeight: ScreenUtil().setHeight(96),
        );
        break;
      case VooButtonSize.small:
        boxConstraints = boxConstraints = BoxConstraints(
          minWidth: ScreenUtil().setWidth(332),
          minHeight: ScreenUtil().setHeight(96),
        );
        break;
      case VooButtonSize.mini:
        boxConstraints = boxConstraints = BoxConstraints(
          minWidth: ScreenUtil().setWidth(152),
          minHeight: ScreenUtil().setHeight(54),
        );
        break;
    }
    return boxConstraints;
  }

  double getTextFontSize() {
    double fontSize = ScreenUtil().setSp(32);
    switch (size) {
      case VooButtonSize.large:
        fontSize = ScreenUtil().setSp(32);
        break;
      case VooButtonSize.small:
        fontSize = ScreenUtil().setSp(32);
        break;
      case VooButtonSize.mini:
        fontSize = ScreenUtil().setSp(24);
        break;
    }
    return fontSize;
  }
}
