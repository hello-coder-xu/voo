import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:voo/checkbox/voo_checkbox_icon.dart';

///单选框
class VooRadio extends StatelessWidget {
  final dynamic value;
  final dynamic group;
  final Function(dynamic value) onChanged;
  final Icon selectIcon;
  final Icon unSelectIcon;
  final String child;
  final bool enable;

  VooRadio({
    @required this.value,
    @required this.group,
    this.onChanged,
    this.selectIcon,
    this.unSelectIcon,
    this.child,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    assert(value != null);
    Widget currentChild;
    Widget checkBoxIcon = VooCheckBoxIcon(selectIcon: selectIcon, unSelectIcon: unSelectIcon, value: value == group);
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
    if (onChanged != null) onChanged(value);
  }
}
