import 'package:example/comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/voo.dart';

///结果页
class ResultPage extends StatelessWidget {
  //结果页
  Widget contentView(BuildContext context) {
    List<Widget> children = [];

    children.add(UiComponent.getListTile(title: '成功页'));

    children.add(VooResult(
      icon: Icon(Icons.check_circle, color: VooColors.accentColor, size: 60),
      title: '操作成功',
      subTitle: '内容说明，建议不超过两行',
      confirm: '主要操作',
      cancel: '辅助操作',
      onConfirm: () => onConfirm(context),
      onCancel: () => onCancel(context),
    ));

    children.add(UiComponent.getListTile(title: '失败页'));
    children.add(VooResult(
      icon: Icon(Icons.error, color: Colors.yellow[700], size: 60),
      title: '无法完成操作',
      subTitle: '内容说明，建议不超过两行',
      confirm: '主要操作',
      cancel: '辅助操作',
      onConfirm: () => onConfirm(context),
      onCancel: () => onCancel(context),
    ));

    children.add(UiComponent.getListTile(title: '等待处理'));
    children.add(VooResult(
      icon: Icon(Icons.timelapse, color: VooColors.accentColor, size: 60),
      title: '等待处理',
      subTitle: '内容说明，建议不超过两行',
      confirm: '主要操作',
      cancel: '辅助操作',
      onConfirm: () => onConfirm(context),
      onCancel: () => onCancel(context),
    ));

    return SingleChildScrollView(child: Column(children: children));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'ResultPreview'),
      body: contentView(context),
    );
  }

  void onConfirm(BuildContext context) {
    VooToast.showToast(context, msg: '点击主要操作');
  }

  void onCancel(BuildContext context) {
    VooToast.showToast(context, msg: '点击辅助操作');
  }
}
