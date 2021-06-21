import 'package:example/comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/voo.dart';

///标签视图
class LabelPage extends StatelessWidget {
  Widget contentView() {
    List<Widget> children = [];
    children.add(VooLabel(value: '作品', style: VooLabelStyle.half_circle));
    children.add(VooLabel(value: '文章', style: VooLabelStyle.half_circle));
    children.add(VooLabel(value: '音影', style: VooLabelStyle.half_circle));
    children.add(VooLabel(value: '公司', style: VooLabelStyle.half_circle));
    children.add(VooLabel(
      value: '最新',
      style: VooLabelStyle.rect,
      bgColor: Colors.green,
    ));

    return SingleChildScrollView(
      padding: EdgeInsets.all(32),
      child: Wrap(
        children: children,
        spacing: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'LabelPage'),
      body: contentView(),
    );
  }
}
