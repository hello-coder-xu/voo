import 'package:flutter/material.dart';
import 'package:voo/voo.dart';

///复选框-图标
class VooCheckBoxIcon extends StatelessWidget {
  final Icon selectIcon;
  final Icon unSelectIcon;
  final bool value;

  VooCheckBoxIcon({
    @required this.value,
    this.selectIcon,
    this.unSelectIcon,
  });

  @override
  Widget build(BuildContext context) {
    assert(value != null);
    Widget child;
    if (value) {
      child = selectIcon ?? Icon(Icons.check_circle, size: 16, color: VooColors.accentColor);
    } else {
      child = unSelectIcon ?? Icon(Icons.radio_button_unchecked, size: 16, color: VooColors.subTitleColor);
    }
    return child;
  }
}
