import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
        );
        tempTextStyle = textStyle ?? TextStyle(fontSize: getTextFontSize(), color: Colors.white);
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
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
        );
        tempTextStyle = textStyle ?? TextStyle(fontSize: getTextFontSize(), color: tempBgColor);
        return Container(
          constraints: getButtonConstraints(),
          child: OutlinedButton(
            child: Text(child, style: tempTextStyle),
            style: ButtonStyle(
              shape: ButtonStyleButton.allOrNull(shapeBorder),
              side: MaterialStateProperty.all(BorderSide(color: tempBgColor, width: 1)),
            ),
            onPressed: onPressed,
          ),
        );
      case VooButtonTheme.capsule: //胶囊类型
        shapeBorder = RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(27)),
        );
        tempTextStyle = textStyle ?? TextStyle(fontSize: getTextFontSize(), color: Colors.white);
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
      minWidth: 152.w,
      minHeight: 54.w,
    );
    switch (size) {
      case VooButtonSize.large:
        boxConstraints = boxConstraints = BoxConstraints(
          minWidth: 686.w,
          minHeight: 96.w,
        );
        break;
      case VooButtonSize.small:
        boxConstraints = boxConstraints = BoxConstraints(
          minWidth: 332.w,
          minHeight: 96.w,
        );
        break;
      case VooButtonSize.mini:
        boxConstraints = boxConstraints = BoxConstraints(
          minWidth: 152.w,
          minHeight: 54.w,
        );
        break;
    }
    return boxConstraints;
  }

  double getTextFontSize() {
    double fontSize = 32.sp;
    switch (size) {
      case VooButtonSize.large:
        fontSize = 32.sp;
        break;
      case VooButtonSize.small:
        fontSize = 32.sp;
        break;
      case VooButtonSize.mini:
        fontSize = 24.sp;
        break;
    }
    return fontSize;
  }
}
