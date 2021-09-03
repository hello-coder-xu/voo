import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///单元格
class VooCellExtension extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final Widget? leading;
  final Widget? trailing;
  final Widget? content;
  final bool showRightIcon;
  final VoidCallback? onTap;

  VooCellExtension({
    this.title = '',
    this.style,
    this.leading,
    this.trailing,
    this.content,
    this.showRightIcon = true,
    this.onTap,
  });

  ///前面视图
  Widget leadingView() {
    Widget titleView = Text(
      title,
      style: style ??
          TextStyle(
            fontSize: 32.sp,
            color: Color(0xff333333),
          ),
    );

    if (leading != null) {
      List<Widget?> children = [];
      children.add(leading);
      children.add(SizedBox(width: 24.w));
      children.add(titleView);
      return Row(children: children as List<Widget>);
    }
    return titleView;
  }

  ///后面视图
  Widget trailingView() {
    Widget valueView = DefaultTextStyle(
      style: TextStyle(fontSize: 32.sp, color: Color(0xffb6b6b6)),
      child: content ?? Text(''),
    );
    List<Widget?> children = [];
    children.add(valueView);
    if (trailing != null) {
      children.add(SizedBox(width: 32.w));
      children.add(trailing);
    } else if (showRightIcon) {
      children.add(SizedBox(width: 16.w));
      children.add(Icon(
        Icons.keyboard_arrow_right,
        size: 40.w,
        color: Color(0xffb6b6b6),
      ));
    }
    return Row(
      children: children as List<Widget>,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(leadingView());
    children.add(Expanded(
      child: Container(
        alignment: Alignment.centerRight,
        child: trailingView(),
      ),
    ));
    Widget child = Container(
      constraints: BoxConstraints(minHeight: 100.h),
      color: Colors.white,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Row(
        children: children,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );

    if (onTap != null) {
      child = GestureDetector(onTap: onTap, child: child);
    }
    return child;
  }
}
