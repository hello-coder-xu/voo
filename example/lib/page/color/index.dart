import 'package:example/comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/voo.dart';

///色值
class ColorPage extends StatelessWidget {
  final List<Map<String, Color>> primaryList = [
    {'主色': VooColors.primaryColor}
  ];

  final List<Map<String, Color>> accentList = [
    {'强调色': VooColors.accentColor}
  ];

  final List<Map<String, Color>> bgList = [
    {'页面背景': VooColors.pageBgColor},
    {'卡片背景': VooColors.cardBgColor}
  ];

  final List<Map<String, Color>> fontList = [
    {'标题': VooColors.titleColor},
    {'副标题': VooColors.subTitleColor},
    {'暗提示': VooColors.darkTipColor},
    {'反白主标题': VooColors.unWhiteTitleColor},
    {'反白副标题': VooColors.unWhiteSubTitleColor},
    {'浅底主标题': VooColors.lightTitleColor},
    {'错误提示': VooColors.errorColor},
    {'链接色': VooColors.linkColor},
  ];

  final List<Map<String, Color>> dividerList = [
    {'分割线': VooColors.dividerLineColor},
    {'分割面': VooColors.dividerAreaColor},
  ];

  final List<Map<String, Color>> layerList = [
    {'产品蒙层': VooColors.layerProduct},
    {'营销蒙层': VooColors.layerMarketing}
  ];

  ///item 视图
  Widget itemView({Map<String, Color> map}) {
    List<Widget> children = [];
    map.forEach((title, color) {
      children.add(Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: VooColors.dividerLineColor, width: 0.5),
        ),
      ));

      children.add(Text(title, style: TextStyle(fontSize: 12, color: VooColors.titleColor)));
      String colorValue = color.toString();
      colorValue = colorValue.replaceAll('Color(0x', '#');
      colorValue = colorValue.replaceAll(')', '');

      children.add(Text(colorValue, style: TextStyle(fontSize: 12, color: VooColors.titleColor)));
    });
    return Column(children: children);
  }

  ///gridview
  Widget gridView({String title, List<Map<String, Color>> list}) {
    List<Widget> children = [];
    children.add(UiComponent.getListTile(title: title));
    children.add(GridView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      physics: new NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (BuildContext context, int index) => itemView(map: list[index]),
    ));
    return Column(children: children);
  }

  ///内容视图
  Widget contentView() {
    List<Widget> children = [];
    children.add(gridView(title: '01主色', list: primaryList));
    children.add(gridView(title: '02强调色', list: accentList));
    children.add(gridView(title: '03背景色', list: bgList));
    children.add(gridView(title: '04文字色', list: fontList));
    children.add(gridView(title: '05分割', list: dividerList));
    children.add(gridView(title: '06遮罩蒙层', list: layerList));
    return SingleChildScrollView(
      child: Column(children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'color'),
      body: contentView(),
    );
  }
}
