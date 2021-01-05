import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:voo/checkbox/voo_checkbox_icon.dart';

///复选框
class VooCheckBox extends StatelessWidget {
  final Icon selectIcon;
  final Icon unSelectIcon;
  final String child;
  final bool value;
  final Function(bool value) onChanged;
  final bool enable;

  VooCheckBox({
    @required this.value,
    this.onChanged,
    this.child,
    this.selectIcon,
    this.unSelectIcon,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    assert(value != null);
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
        child: SizedBox(width: ScreenUtil().setWidth(22)),
      ));
      children.add(WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: Text(
          child,
          style: TextStyle(
            color: Color(0xff333333),
            fontSize: ScreenUtil().setSp(32),
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
    if (onChanged != null) onChanged(!value);
  }
}

///复选框
class VooCheckBoxRule extends StatelessWidget {
  final Icon selectIcon;
  final Icon unSelectIcon;
  final TextSpan child;
  final bool value;
  final Function(bool value) onChanged;
  final bool enable;

  VooCheckBoxRule({
    @required this.value,
    this.onChanged,
    this.child,
    this.selectIcon,
    this.unSelectIcon,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    assert(value != null);
    Widget currentChild;
    Widget checkBoxIcon = VooCheckBoxIcon(
        selectIcon: selectIcon, unSelectIcon: unSelectIcon, value: value);
    if (child == null) {
      currentChild = checkBoxIcon;
    } else {
      List<InlineSpan> children = [];
      children.add(WidgetSpan(
        child: checkBoxIcon,
        alignment: PlaceholderAlignment.middle,
      ));
      children.add(WidgetSpan(
        child: SizedBox(width: ScreenUtil().setWidth(22)),
      ));
      children.add(child);
      currentChild = Text.rich(
        TextSpan(
            children: children,
            style: TextStyle(
              color: Color(0xff333333),
              fontSize: ScreenUtil().setSp(32),
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
    if (onChanged != null) onChanged(!value);
  }
}
