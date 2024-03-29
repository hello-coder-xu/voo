import 'package:flutter/material.dart';
import 'package:voo/color/index.dart';

///加载
class VooLoading extends StatelessWidget {
  //显示大小
  final double size;
  //颜色
  final Color color;
  //标题
  final String? title;
  //是否水平
  final bool horizontal;

  VooLoading({
    this.size = 30,
    this.color = Colors.grey,
    this.title,
    this.horizontal = true,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    children.add(Container(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation(color),
      ),
    ));

    if (title != null) {
      children.add(SizedBox(width: 8, height: 8));
      children.add(Text(title!, style: TextStyle(fontSize: 14, color: VooColors.subTitleColor)));
    }

    if (horizontal) {
      return Row(children: children);
    } else {
      return Column(children: children);
    }
  }
}
