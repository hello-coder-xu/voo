import 'package:flutter/material.dart';
import 'package:voo/checkbox/voo_checkbox_icon.dart';

///单选框
class VooRadio extends StatelessWidget {
  final dynamic value;
  final dynamic group;
  final Function(dynamic value) onChanged;
  final Icon selectIcon;
  final Icon unSelectIcon;
  final TextSpan child;
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
      children.add(WidgetSpan(child: checkBoxIcon));
      children.add(WidgetSpan(child: SizedBox(width: 4)));
      children.add(child);
      currentChild = Text.rich(TextSpan(children: children), textAlign: TextAlign.left);
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
