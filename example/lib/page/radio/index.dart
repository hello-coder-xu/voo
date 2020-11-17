import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/color/index.dart';
import 'package:voo/radio/voo_radio.dart';

///单选框
class RadioPage extends StatefulWidget {
  @override
  RadioPageState createState() => RadioPageState();
}

class RadioPageState extends State<RadioPage> {
  String baseValue = '1';

  String banValue = '1';

  String customValue = '1';

  String agreementValue = '1';

  Widget contentView() {
    List<Widget> children = [];
    children.add(UiComponent.getListTile(title: '基础用法'));
    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: VooRadio(
              value: '1',
              group: baseValue,
              child: TextSpan(text: '复选框 1'),
              onChanged: (value) {
                this.baseValue = value;
                setState(() {});
              },
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 8),
            child: VooRadio(
              value: '2',
              group: baseValue,
              child: TextSpan(text: '复选框 2'),
              onChanged: (value) {
                this.baseValue = value;
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
            child: VooRadio(
              value: '1',
              group: banValue,
              enable: false,
              child: TextSpan(text: '复选框 1'),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 8),
            child: VooRadio(
              value: '2',
              group: banValue,
              enable: false,
              child: TextSpan(text: '复选框 2', style: TextStyle(color: VooColors.titleColor)),
            ),
          )
        ],
      ),
    ));

    children.add(UiComponent.getListTile(title: '自定义图标'));

    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: VooRadio(
              value: '1',
              group: customValue,
              child: TextSpan(text: '复选框 1'),
              selectIcon: Icon(Icons.brightness_7, color: VooColors.accentColor),
              unSelectIcon: Icon(Icons.brightness_5, color: VooColors.subTitleColor),
              onChanged: (value) {
                this.customValue = value;
                setState(() {});
              },
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 8),
            child: VooRadio(
              value: '2',
              group: customValue,
              child: TextSpan(text: '复选框 2'),
              selectIcon: Icon(Icons.brightness_7, color: VooColors.accentColor),
              unSelectIcon: Icon(Icons.brightness_5, color: VooColors.subTitleColor),
              onChanged: (value) {
                this.customValue = value;
                setState(() {});
              },
            ),
          )
        ],
      ),
    ));
    return Column(children: children);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'RadioPreview'),
      body: contentView(),
    );
  }
}
