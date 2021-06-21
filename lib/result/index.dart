import 'package:flutter/material.dart';
import 'package:voo/button/index.dart';
import 'package:voo/color/index.dart';

///结果视图
class VooResult extends StatelessWidget {
  //icon视图
  final Widget icon;
  //标题
  final String title;
  //副标题
  final String subTitle;
  //确定文本
  final String confirm;
  //取消文本
  final String cancel;
  //是否显示取消
  final bool showCancel;
  //确定事件
  final VoidCallback onConfirm;
  //取消事件
  final VoidCallback onCancel;

  VooResult({
    @required this.icon,
    @required this.title,
    this.subTitle,
    this.confirm,
    this.cancel,
    this.showCancel = true,
    this.onConfirm,
    this.onCancel,
  });

  //顶部视图
  Widget topView() {
    List<Widget> children = [];

    if (icon != null) {
      children.add(icon);
    }

    if (title != null) {
      if (children.length > 0) {
        children.add(SizedBox(height: 8));
      }
      children.add(Text(title, style: TextStyle(fontSize: 16, color: VooColors.titleColor)));
    }

    if (subTitle != null) {
      if (children.length > 1) {
        children.add(SizedBox(height: 8));
      }
      children.add(Text(subTitle, style: TextStyle(fontSize: 14, color: VooColors.subTitleColor)));
    }

    return Container(
      color: Colors.white,
      constraints: BoxConstraints(minHeight: 180),
      alignment: Alignment.center,
      child: Column(children: children),
    );
  }

  //底部视图
  Widget bottomView() {
    List<Widget> children = [];
    children.add(VooButton(
      child: confirm ?? '',
      onTap: onConfirm,
    ));

    if (showCancel) {
      children.add(SizedBox(height: 8));
      children.add(VooButton(
        child: cancel ?? '',
        style: VooButtonStyle.accent,
        onTap: onCancel,
      ));
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(topView());
    children.add(bottomView());
    return Column(children: children);
  }
}
