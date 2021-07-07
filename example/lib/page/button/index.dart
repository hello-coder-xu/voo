import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';

import 'package:voo/button/index.dart';

///按钮页面
class ButtonPage extends StatelessWidget {
  //内容视图
  Widget contentView() {
    List<Widget> children = [];
    children.add(UiComponent.getListTile(title: '按钮展示'));

    children.add(VooButton(
      child: '大按钮-可用',
      style: VooButtonStyle.normal,
      onTap: () {},
    ));

    children.add(SizedBox(height: 16));
    children.add(VooButton(
      child: '大按钮-不可用',
      style: VooButtonStyle.normal,
      enable: false,
    ));

    children.add(SizedBox(height: 16));
    children.add(VooButton(
      child: '边框按钮-可用',
      style: VooButtonStyle.accent,
      onTap: () {},
    ));

    children.add(SizedBox(height: 16));
    children.add(VooButton(
      child: '边框按钮-不可用',
      style: VooButtonStyle.accent,
      enable: false,
    ));

    children.add(SizedBox(height: 16));
    children.add(VooButton(
      child: '胶囊按钮-可用',
      style: VooButtonStyle.capsule,
      onTap: () {},
    ));

    children.add(SizedBox(height: 16));
    children.add(VooButton(
      child: '胶囊按钮-不可用',
      style: VooButtonStyle.capsule,
      enable: false,
    ));

    children.add(SizedBox(height: 16));
    children.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        VooButton(
          child: '辅助按钮',
          style: VooButtonStyle.accent,
          size: VooButtonSize.small,
          onTap: () {},
        ),
        VooButton(
          child: '辅助按钮',
          style: VooButtonStyle.normal,
          size: VooButtonSize.small,
          onTap: () {},
        )
      ],
    ));

    children.add(SizedBox(height: 16));
    children.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        VooButton(
          child: '小按钮',
          style: VooButtonStyle.normal,
          size: VooButtonSize.mini,
          onTap: (){},
        ),
        VooButton(
          child: '小按钮',
          style: VooButtonStyle.accent,
          size: VooButtonSize.mini,
          onTap: (){},
        ),
        VooButton(
          child: '小按钮',
          style: VooButtonStyle.capsule,
          size: VooButtonSize.mini,
          onTap: (){},
        )
      ],
    ));

    return SingleChildScrollView(
      child: Column(children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'ButtonPreview'),
      body: contentView(),
    );
  }
}
