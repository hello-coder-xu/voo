import 'package:example/comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/color/index.dart';
import 'package:voo/checkbox/voo_checkbox.dart';

///复选框
class CheckBoxPage extends StatefulWidget {
  @override
  CheckBoxPageState createState() => CheckBoxPageState();
}

class CheckBoxPageState extends State<CheckBoxPage> {
  bool baseValue1 = false;
  bool baseValue2 = false;
  bool banValue = false;
  bool customValue = false;
  bool agreementValue = false;

  Widget contentView() {
    List<Widget> children = [];
    children.add(UiComponent.getListTile(title: '基础用法'));
    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: VooCheckBox(
              value: baseValue1,
              child: TextSpan(text: '复选框 1'),
              onChanged: (value) {
                this.baseValue1 = value;
                setState(() {});
              },
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 8),
            child: VooCheckBox(
              value: baseValue2,
              child: TextSpan(text: '复选框 2', style: TextStyle(color: VooColors.titleColor)),
              onChanged: (value) {
                this.baseValue2 = value;
                setState(() {});
              },
            ),
          )
        ],
      ),
    ));

    children.add(UiComponent.getListTile(title: '禁用状态'));
    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: VooCheckBox(
              value: false,
              enable: false,
              child: TextSpan(text: '复选框 1'),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 8),
            child: VooCheckBox(
              value: true,
              enable: false,
              child: TextSpan(text: '复选框 2', style: TextStyle(color: VooColors.titleColor)),
            ),
          )
        ],
      ),
    ));

    children.add(UiComponent.getListTile(title: '自定义图标'));
    children.add(Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: VooCheckBox(
        value: customValue,
        selectIcon: Icon(Icons.brightness_7, color: VooColors.accentColor),
        unSelectIcon: Icon(Icons.brightness_5, color: VooColors.subTitleColor),
        child: TextSpan(text: '复选框'),
        onChanged: (value) {
          this.customValue = value;
          setState(() {});
        },
      ),
    ));
    children.add(UiComponent.getListTile(title: '协议选择'));
    children.add(Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: VooCheckBox(
        value: agreementValue,
        child: TextSpan(children: [
          TextSpan(text: '我已仔细阅读并同意'),
          TextSpan(text: '[服务条款]', style: TextStyle(color: Colors.blue)),
        ]),
        onChanged: (value) {
          this.agreementValue = value;
          setState(() {});
        },
      ),
    ));
    return Column(children: children);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'CheckBoxPreview'),
      body: contentView(),
    );
  }
}
