import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///单元格
class VooCell extends StatelessWidget {
  final String title;
  final TextStyle style;
  final Widget leading;
  final bool showRightIcon;
  final String content;
  final TextStyle contentStyle;
  final VoidCallback onTap;

  VooCell({
    this.title = '',
    this.style,
    this.leading,
    this.showRightIcon = true,
    this.content = '',
    this.contentStyle,
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
      List<Widget> children = [];
      children.add(leading);
      children.add(SizedBox(width: 24.w));
      children.add(titleView);
      return Row(children: children, crossAxisAlignment: CrossAxisAlignment.center);
    }
    return titleView;
  }

  ///后面视图
  Widget trailingView() {
    Widget valueView = Text(
      content,
      style: contentStyle ??
          TextStyle(
            fontSize: 32.sp,
            color: Color(0xffb6b6b6),
          ),
    );
    List<Widget> children = [];
    children.add(valueView);
    if (showRightIcon) {
      children.add(SizedBox(width: 16.w));
      children.add(Icon(
        Icons.keyboard_arrow_right,
        size: 40.w,
        color: Color(0xffb6b6b6),
      ));
    }
    return Row(
      children: children,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
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
