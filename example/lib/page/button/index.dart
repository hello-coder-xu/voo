import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';

import 'package:voo/button/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      child: '有图标-可用',
      style: VooButtonStyle.normal,
      icon: Icon(Icons.email),
      onTap: () {},
    ));

    children.add(SizedBox(height: 16));
    children.add(VooButton(
      child: '有图标-不可用',
      style: VooButtonStyle.normal,
      icon: Icon(Icons.email),
      enable: false,
    ));

    children.add(SizedBox(height: 16));
    children.add(VooButton(
      child: '边框按钮-可用',
      hollow: true,
      onTap: () {},
    ));

    children.add(SizedBox(height: 16));
    children.add(VooButton(
      child: '边框按钮-不可用',
      hollow: true,
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
      onTap: () {},
    ));

    children.add(SizedBox(height: 16));
    children.add(VooButton(
      child: '胶囊按钮-可用',
      style: VooButtonStyle.capsule,
      hollow: true,
      onTap: () {},
    ));

    children.add(SizedBox(height: 16));
    children.add(VooButton(
      child: '胶囊按钮-不可用',
      style: VooButtonStyle.capsule,
      enable: false,
      hollow: true,
      onTap: () {},
    ));

    children.add(SizedBox(height: 16));
    children.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        VooButton(
          child: '辅助按钮',
          hollow: true,
          size: VooButtonSize.small,
          icon: Icon(Icons.email),
          onTap: () {},
        ),
        VooButton(
          child: '辅助按钮',
          style: VooButtonStyle.normal,
          size: VooButtonSize.small,
          icon: Icon(Icons.email),
          onTap: () {},
        )
      ],
    ));

    children.add(SizedBox(height: 16));
    children.add(Wrap(
      runSpacing: 16.w,
      spacing: 16.w,
      children: [
        VooButton(
          child: '小按钮',
          style: VooButtonStyle.normal,
          size: VooButtonSize.mini,
          onTap: () {},
        ),
        VooButton(
          child: '小按钮',
          hollow: true,
          size: VooButtonSize.mini,
          onTap: () {},
        ),
        VooButton(
          child: '小按钮',
          hollow: true,
          size: VooButtonSize.mini,
          style: VooButtonStyle.capsule,
          onTap: () {},
        ),
        VooButton(
          child: '小按钮',
          style: VooButtonStyle.capsule,
          size: VooButtonSize.mini,
          onTap: () {},
        )
      ],
    ));

    children.add(SizedBox(height: 16));
    children.add(Wrap(
      runSpacing: 16.w,
      spacing: 16.w,
      children: [
        VooButton(
          child: '小按钮',
          style: VooButtonStyle.normal,
          size: VooButtonSize.mini,
          icon: Icon(Icons.email, size: 20, color: Colors.white),
          onTap: () {},
        ),
        VooButton(
          child: '小按钮',
          hollow: true,
          size: VooButtonSize.mini,
          icon: Icon(Icons.email, size: 20, color: Color(0xff25c489)),
          onTap: () {},
        ),
        VooButton(
          child: '小按钮',
          hollow: true,
          size: VooButtonSize.mini,
          style: VooButtonStyle.capsule,
          icon: Icon(Icons.email, size: 20, color: Color(0xff25c489)),
          onTap: () {},
        ),
        VooButton(
          child: '小按钮',
          style: VooButtonStyle.capsule,
          size: VooButtonSize.mini,
          icon: Icon(Icons.email, size: 20, color: Colors.white),
          onTap: () {},
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
