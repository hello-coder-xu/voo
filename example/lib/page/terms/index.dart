import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/button/index.dart';
import 'package:voo/checkbox/voo_checkbox.dart';
import 'package:voo/toast/index.dart';

///协议
class TermsPage extends StatefulWidget {
  @override
  TermsPageState createState() => TermsPageState();
}

class TermsPageState extends State<TermsPage> {
  bool checked1 = false;
  bool checked2 = false;
  bool checked3 = false;

  ///条款文案
  TextSpan getSpanView() {
    List<TextSpan> children = [];
    children.add(TextSpan(text: '我已仔細閱讀並同意'));
    children.add(TextSpan(
      text: '[服務條款]',
      style: TextStyle(color: Colors.blue),
    ));
    return TextSpan(children: children);
  }

  ///内容视图
  Widget contentView() {
    List<Widget> children = [];
    children.add(UiComponent.getListTile(title: '基础样式'));
    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      child: VooCheckBoxRule(
        child: getSpanView(),
        value: checked1,
        onChanged: (value) {
          checked1 = value;
          setState(() {});
        },
      ),
    ));
    children.add(Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8),
      alignment: Alignment.centerLeft,
      child: VooButton(
        child: '确认',
        onTap: checked1 ? () => VooToast.showToast(context, msg: '点击确认') : null,
      ),
    ));

    children.add(UiComponent.getListTile(title: '双按钮样式'));
    children.add(Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      child: VooCheckBoxRule(
        child: getSpanView(),
        value: checked2,
        onChanged: (value) {
          checked2 = value;
          setState(() {});
        },
      ),
    ));
    children.add(Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8),
      alignment: Alignment.centerLeft,
      child: VooButton(
        child: '确认',
        onTap: checked2 ? () => VooToast.showToast(context, msg: '点击确认') : null,
      ),
    ));
    children.add(GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        VooToast.showToast(context, msg: '点击清除');
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        alignment: Alignment.center,
        child: Text('清除', style: TextStyle(fontSize: 16, color: Colors.red)),
      ),
    ));

    children.add(UiComponent.getListTile(title: '带辅助描述'));

    children.add(Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8),
      alignment: Alignment.centerLeft,
      child: VooButton(
        child: '确认',
        onTap: () {
          VooToast.showToast(context, msg: '点击确认');
        },
      ),
    ));
    children.add(Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8),
      alignment: Alignment.centerLeft,
      child: Text.rich(getSpanView()),
    ));

    return SingleChildScrollView(
      child: Column(children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'TermsPreview'),
      body: contentView(),
    );
  }
}
