import 'package:voo/cell/index.dart';
import 'package:voo/voo.dart';

import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';

///单元格
class CellPage extends StatefulWidget {
  @override
  _CellPageState createState() => _CellPageState();
}

class _CellPageState extends State<CellPage> {
  int selectCheckedIndex = 0;
  bool selectRadio1 = true;
  bool selectRadio2 = false;
  bool selectRadio3 = false;
  bool switchOpen1 = true;
  bool switchOpen2 = false;

  //内容视图
  Widget contentView(BuildContext context) {
    List<Widget> children = [];

    children.add(SizedBox(height: 32));
    children.add(VooCell(
      title: '所在城市',
    ));

    children.add(SizedBox(height: 32));
    children.add(VooCell(
      title: '所在城市',
      content: '选择房屋所在城市',
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      title: '所在城市',
      content: '台北市',
      contentStyle: TextStyle(color: Colors.black87),
    ));

    children.add(SizedBox(height: 32));
    children.add(VooCell(
      title: '关于100室内设计',
      content: 'V5.4.2',
    ));

    children.add(SizedBox(height: 32));
    children.add(VooCellCheckBox(
      title: '单选1',
      checked: selectCheckedIndex == 0,
      onTap: () {
        setState(() {
          selectCheckedIndex = 0;
        });
      },
    ));
    children.add(Divider(height: 1));
    children.add(VooCellCheckBox(
      title: '单选2',
      checked: selectCheckedIndex == 1,
      onTap: () {
        setState(() {
          selectCheckedIndex = 1;
        });
      },
    ));
    children.add(Divider(height: 1));
    children.add(VooCellCheckBox(
      title: '单选3',
      checked: selectCheckedIndex == 2,
      onTap: () {
        setState(() {
          selectCheckedIndex = 2;
        });
      },
    ));

    children.add(SizedBox(height: 32));
    children.add(VooCellRadioBox(
      title: '多选1',
      checked: selectRadio1,
      onTap: () {
        setState(() {
          selectRadio1 = !selectRadio1;
        });
      },
    ));
    children.add(Divider(height: 1));
    children.add(VooCellRadioBox(
      title: '多选2',
      checked: selectRadio2,
      onTap: () {
        setState(() {
          selectRadio2 = !selectRadio2;
        });
      },
    ));
    children.add(Divider(height: 1));
    children.add(VooCellRadioBox(
      title: '多选3',
      checked: selectRadio3,
      onTap: () {
        setState(() {
          selectRadio3 = !selectRadio3;
        });
      },
    ));

    children.add(SizedBox(height: 32));
    children.add(VooCellSwitch(
      title: '推播消息通知',
      checked: switchOpen1,
      onChanged: (value) {
        setState(() {
          switchOpen1 = value;
        });
      },
    ));
    children.add(Divider(height: 1));
    children.add(VooCellSwitch(
      title: '推播提示音',
      checked: switchOpen2,
      onChanged: (value) {
        setState(() {
          switchOpen2 = value;
        });
      },
    ));

    children.add(SizedBox(height: 32));
    return SingleChildScrollView(child: Column(children: children));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'CellPreview'),
      body: contentView(context),
    );
  }
}
