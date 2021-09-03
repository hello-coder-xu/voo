import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voo/checkbox/voo_checkbox_icon.dart';

/// 单元-多选
class VooCellRadioBox extends StatelessWidget {
  final bool checked;
  final Icon? selectIcon;
  final Icon? unSelectIcon;
  final String? title;
  final TextStyle? style;
  final VoidCallback? onTap;

  VooCellRadioBox({
    this.checked = false,
    this.onTap,
    this.selectIcon,
    this.unSelectIcon,
    this.title,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    Widget currentChild;
    Widget checkBoxIcon = VooCheckBoxIcon(selectIcon: selectIcon, unSelectIcon: unSelectIcon, value: checked);
    if (title == null) {
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
          title!,
          style: style ??
              TextStyle(
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

    currentChild = Container(
      constraints: BoxConstraints(minHeight: 100.h),
      color: Colors.white,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: currentChild,
    );

    if (onTap != null) {
      currentChild = GestureDetector(
        onTap: onTap,
        child: currentChild,
      );
    }
    return currentChild;
  }
}
