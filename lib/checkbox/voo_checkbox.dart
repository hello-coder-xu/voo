import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voo/checkbox/voo_checkbox_icon.dart';

///复选框
class VooCheckBox extends StatelessWidget {
  //选中图标
  final Icon? selectIcon;

  //未选中图标
  final Icon? unSelectIcon;

  //显示文案
  final String? child;

  //是否选中
  final bool value;

  //选中变化事件
  final Function(bool value)? onChanged;

  //是否可用
  final bool enable;

  VooCheckBox({
    required this.value,
    this.onChanged,
    this.child,
    this.selectIcon,
    this.unSelectIcon,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget currentChild;
    Widget checkBoxIcon = VooCheckBoxIcon(
      selectIcon: selectIcon,
      unSelectIcon: unSelectIcon,
      value: value,
    );
    if (child == null) {
      currentChild = checkBoxIcon;
    } else {
      List<InlineSpan> children = [];
      children.add(WidgetSpan(
        child: checkBoxIcon,
        alignment: PlaceholderAlignment.middle,
      ));
      children.add(WidgetSpan(
        child: SizedBox(width: 22.w),
      ));
      children.add(WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: Text(
          child!,
          style: TextStyle(
            color: Color(0xff333333),
            fontSize: 32.sp,
          ),
        ),
      ));
      currentChild = Text.rich(
        TextSpan(children: children),
        textAlign: TextAlign.center,
      );
    }
    if (!enable) return Opacity(opacity: 0.5, child: currentChild);
    return GestureDetector(
      onTap: _onChanged,
      child: currentChild,
    );
  }

  void _onChanged() {
    if (onChanged != null) onChanged!(!value);
  }
}

///复选框
class VooCheckBoxRule extends StatelessWidget {
  final Icon? selectIcon;
  final Icon? unSelectIcon;
  final TextSpan? child;
  final bool value;
  final Function(bool value)? onChanged;
  final bool enable;

  VooCheckBoxRule({
    required this.value,
    this.onChanged,
    this.child,
    this.selectIcon,
    this.unSelectIcon,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget currentChild;
    Widget checkBoxIcon = VooCheckBoxIcon(
        selectIcon: selectIcon, unSelectIcon: unSelectIcon, value: value);
    if (child == null) {
      currentChild = checkBoxIcon;
    } else {
      List<InlineSpan?> children = [];
      children.add(WidgetSpan(
        child: checkBoxIcon,
        alignment: PlaceholderAlignment.middle,
      ));
      children.add(WidgetSpan(
        child: SizedBox(width: 22.w),
      ));
      children.add(child);
      currentChild = Text.rich(
        TextSpan(
            children: children as List<InlineSpan>?,
            style: TextStyle(
              color: Color(0xff333333),
              fontSize: 32.sp,
            )),
        textAlign: TextAlign.left,
      );
    }
    if (!enable) return Opacity(opacity: 0.5, child: currentChild);
    return GestureDetector(
      onTap: _onChanged,
      child: currentChild,
    );
  }

  void _onChanged() {
    if (onChanged != null) onChanged!(!value);
  }
}
