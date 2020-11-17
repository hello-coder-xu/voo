import 'package:flutter/material.dart';
import 'package:voo/checkbox/voo_checkbox_icon.dart';
import 'package:voo/color/index.dart';


///复选框
class VooCheckBox extends StatelessWidget {
  final Icon selectIcon;
  final Icon unSelectIcon;
  final TextSpan child;
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
    Widget checkBoxIcon = VooCheckBoxIcon(selectIcon: selectIcon, unSelectIcon: unSelectIcon, value: value);
    if (child == null) {
      currentChild = checkBoxIcon;
    } else {
      List<InlineSpan> children = [];
      children.add(WidgetSpan(child: checkBoxIcon));
      children.add(WidgetSpan(child: SizedBox(width: 4)));
      children.add(child);
      currentChild = Text.rich(TextSpan(children: children, style: TextStyle(color: VooColors.titleColor)), textAlign: TextAlign.left);
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
