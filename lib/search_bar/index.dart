import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voo/field/index.dart';

///搜索栏
class VooSearchBar extends StatelessWidget {
  final Widget leading;
  final String hintText;
  final TextStyle hintStyle;
  final TextStyle style;
  final TextAlign align;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final bool showClear;
  final bool readOnly;
  final Widget trailing;
  final Widget contentIcon;
  final Color bgColor;
  final Color roundBgColor;

  VooSearchBar({
    this.leading,
    this.hintText,
    this.hintStyle,
    this.style,
    this.align=TextAlign.left,
    this.controller,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.showClear,
    this.readOnly=false,
    this.contentIcon,
    this.trailing,
    this.bgColor,
    this.roundBgColor,
  });

  //中间视图
  Widget contentView() {
    List<Widget> children = [];
    if (contentIcon != null) {
      children.add(contentIcon);
    } else {
      children.add(Icon(
        Icons.search,
        color: Color(0xffbfbfbf),
        size: ScreenUtil().setWidth(36),
      ));
    }

    children.add(SizedBox(width: ScreenUtil().setWidth(24)));
    children.add(Expanded(
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: hintStyle ??
              TextStyle(
                fontSize: ScreenUtil().setSp(32),
                color: Color(0xffb6b6b6),
              ),
          isCollapsed: true,
        ),
        style: style ??
            TextStyle(
              fontSize: ScreenUtil().setSp(32),
              color: Color(0xff333333),
            ),
        textAlign: align,
        maxLines: 1,
        showClear: showClear,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        onEditingComplete: onEditingComplete,
        readOnly: readOnly,
        controller: controller,
      ),
    ));

    return Container(
      height:ScreenUtil().setWidth(64),
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(32)),
        color: roundBgColor ?? Color(0xfff6f6f6),
      ),
      child: Row(children: children, mainAxisSize: MainAxisSize.min),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    if (leading != null) {
      children.add(Container(
        constraints: BoxConstraints(maxHeight: ScreenUtil().setWidth(96)),
        margin: EdgeInsets.only(right: ScreenUtil().setWidth(16)),
        child: leading,
        alignment: Alignment.center,
      ));
    }

    children.add(Expanded(child: contentView()));

    if (trailing != null) {
      children.add(Container(
        constraints: BoxConstraints(maxHeight: ScreenUtil().setWidth(96)),
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(16)),
        child: trailing,
        alignment: Alignment.center,
      ));
    }

    return Container(
      height: ScreenUtil().setWidth(96),
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(32)),
      alignment: Alignment.center,
      color: bgColor ?? Colors.white,
      child: Row(
          children: children, crossAxisAlignment: CrossAxisAlignment.center),
    );
  }
}
