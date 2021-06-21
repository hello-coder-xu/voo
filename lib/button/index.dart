import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum VooButtonStyle { normal, accent, capsule }

enum VooButtonSize { large, small, mini }

///按钮视图
class VooButton extends StatelessWidget {
  //文本内容
  final String child;

  //文本字体样式
  final TextStyle textStyle;

  //背景颜色
  final Color bgColor;

  //显示样式
  final VooButtonStyle style;

  //显示大小
  final VooButtonSize size;

  //阴影大小
  final double elevation;

  //点击事件
  final VoidCallback onTap;

  VooButton({
    @required this.child,
    this.textStyle,
    this.bgColor,
    this.style = VooButtonStyle.normal,
    this.size = VooButtonSize.large,
    this.elevation = 0.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ShapeBorder shapeBorder;
    TextStyle tempTextStyle;
    Color tempBgColor = bgColor ?? Color(0xff25c489);
    if (onTap == null) {
      tempBgColor = tempBgColor.withOpacity(0.7);
    }
    switch (style) {
      case VooButtonStyle.normal:
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
            onPressed: onTap,
          ),
        );
      case VooButtonStyle.accent:
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
            onPressed: onTap,
          ),
        );
      case VooButtonStyle.capsule: //胶囊类型
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
            onPressed: onTap,
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
