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
      theme: VooButtonTheme.normal,
      onPressed: () {},
    ));

    children.add(SizedBox(height: 16));
    children.add(VooButton(
      child: '大按钮-不可用',
      theme: VooButtonTheme.normal,
      onPressed: null,
    ));

    children.add(SizedBox(height: 16));
    children.add(VooButton(
      child: '边框按钮-可用',
      theme: VooButtonTheme.accent,
      onPressed: () {},
    ));

    children.add(SizedBox(height: 16));
    children.add(VooButton(
      child: '边框按钮-不可用',
      theme: VooButtonTheme.accent,
    ));

    children.add(SizedBox(height: 16));
    children.add(VooButton(
      child: '胶囊按钮-可用',
      theme: VooButtonTheme.capsule,
      onPressed: () {},
    ));

    children.add(SizedBox(height: 16));
    children.add(VooButton(
      child: '胶囊按钮-不可用',
      theme: VooButtonTheme.capsule,
    ));

    children.add(SizedBox(height: 16));
    children.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        VooButton(
          child: '辅助按钮',
          theme: VooButtonTheme.accent,
          size: VooButtonSize.small,
          onPressed: () {},
        ),
        VooButton(
          child: '辅助按钮',
          theme: VooButtonTheme.normal,
          size: VooButtonSize.small,
          onPressed: () {},
        )
      ],
    ));

    children.add(SizedBox(height: 16));
    children.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        VooButton(
          child: '小按钮',
          theme: VooButtonTheme.normal,
          size: VooButtonSize.mini,
          onPressed: (){},
        ),
        VooButton(
          child: '小按钮',
          theme: VooButtonTheme.accent,
          size: VooButtonSize.mini,
          onPressed: (){},
        ),
        VooButton(
          child: '小按钮',
          theme: VooButtonTheme.capsule,
          size: VooButtonSize.mini,
          onPressed: (){},
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
