import 'package:flutter/material.dart';

///
class VooCellField extends StatelessWidget {
  final Widget child;
  final Widget leading;
  final Widget trailing;
  final Text title;
  final double paddingWidth;

  VooCellField({
    @required this.child,
    @required this.title,
    this.leading,
    this.trailing,
    this.paddingWidth = 16,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    if (leading != null) {
      children.add(Container(
        constraints: BoxConstraints(minHeight: 48),
        padding: EdgeInsets.only(right: 8),
        alignment: Alignment.center,
        child: leading,
      ));
    }

    children.add(Container(
      constraints: BoxConstraints(minHeight: 48),
      alignment: Alignment.centerLeft,
      child: title,
    ));

    children.add(SizedBox(width: paddingWidth));

    children.add(Expanded(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 48),
        child: Align(
          alignment: Alignment.centerLeft,
          child: child,
        ),
      ),
    ));

    if (trailing != null) {
      children.add(Container(
        constraints: BoxConstraints(minHeight: 48),
        alignment: Alignment.center,
        child: trailing,
      ));
    }
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: children,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
