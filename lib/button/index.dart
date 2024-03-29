import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum VooButtonStyle {
  normal, //填充
  capsule, //胶囊
}

enum VooButtonSize { large, small, mini }

///按钮视图
class VooButton extends StatelessWidget {
  //文本内容
  final String child;

  //图标视图
  final Widget? icon;

  //文本字体样式
  final TextStyle? textStyle;

  //背景颜色
  final Color? bgColor;

  //边框颜色
  final Color? borderColor;

  //显示样式
  final VooButtonStyle style;

  //显示大小
  final VooButtonSize size;

  //阴影大小
  final double elevation;

  //点击事件
  final VoidCallback? onTap;

  //是否可用
  final bool enable;

  //是否空心
  final bool hollow;

  VooButton({
    required this.child,
    this.icon,
    this.textStyle,
    this.bgColor,
    this.borderColor,
    this.style = VooButtonStyle.normal,
    this.size = VooButtonSize.large,
    this.elevation = 0.0,
    this.onTap,
    this.enable = true,
    this.hollow = false,
  });

  @override
  Widget build(BuildContext context) {
    ShapeBorder shapeBorder;

    Color tempBgColor = getBackgroundColor();
    Color tempBorderColor = borderColor ?? Color(0xff25c489);
    VoidCallback? onPressed = onTap;
    // if (enable) onPressed = onTap;
    Widget btnView;
    switch (style) {
      case VooButtonStyle.normal:
        shapeBorder = RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
        );
        btnView = TextButton(
          style: ButtonStyle(
            padding: ButtonStyleButton.allOrNull(EdgeInsets.zero),
            shape: ButtonStyleButton.allOrNull(shapeBorder as OutlinedBorder?),
            backgroundColor: ButtonStyleButton.allOrNull(tempBgColor),
            side: hollow
                ? MaterialStateProperty.all(
                    BorderSide(color: tempBorderColor, width: 1))
                : null,
            elevation: ButtonStyleButton.allOrNull(elevation),
          ),
          child: btnContentView(),
          onPressed: onPressed,
        );
        break;
      case VooButtonStyle.capsule: //胶囊类型
        shapeBorder = RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(27)),
        );
        btnView = TextButton(
          style: ButtonStyle(
            padding: ButtonStyleButton.allOrNull(EdgeInsets.zero),
            shape: ButtonStyleButton.allOrNull(shapeBorder as OutlinedBorder?),
            backgroundColor: ButtonStyleButton.allOrNull(tempBgColor),
            side: hollow
                ? MaterialStateProperty.all(
                    BorderSide(color: tempBorderColor, width: 1))
                : null,
            elevation: ButtonStyleButton.allOrNull(elevation),
          ),
          child: btnContentView(),
          onPressed: onPressed,
        );
        break;
      default:
        btnView = SizedBox.shrink();
    }
    btnView = Container(
      constraints: getButtonConstraints(),
      child: btnView,
    );
    if (!enable) {
      btnView = Opacity(opacity: 0.3, child: btnView);
    }
    return btnView;
  }

  ///背景颜色
  Color getBackgroundColor() {
    Color tempBgColor;
    if (hollow) {
      tempBgColor = Colors.white;
    } else {
      tempBgColor = Color(0xff25c489);
    }
    return bgColor ?? tempBgColor;
  }

  ///大小
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

  ///字体大小
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

  ///图标大小
  double getIconPadding() {
    double iconPadding = 16.w;
    switch (size) {
      case VooButtonSize.large:
        iconPadding = 16.w;
        break;
      case VooButtonSize.small:
        iconPadding = 16.w;
        break;
      case VooButtonSize.mini:
        iconPadding = 8.w;
        break;
    }
    return iconPadding;
  }

  ///字体颜色
  Color getTextColor() {
    Color tempTextColor;
    if (hollow) {
      tempTextColor = Color(0xff25c489);
    } else {
      tempTextColor = Colors.white;
    }
    return tempTextColor;
  }

  ///文案
  Widget textView() {
    TextStyle tempTextStyle = TextStyle(
      fontSize: getTextFontSize(),
      color: getTextColor(),
    );
    return Text(child, style: textStyle ?? tempTextStyle);
  }

  ///按钮视图
  Widget btnContentView() {
    if (icon == null) return textView();
    List<Widget> children = [];
    children.add(icon!);
    children.add(SizedBox(width: getIconPadding()));
    children.add(Flexible(child: textView()));
    return Row(
      children: children,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}
