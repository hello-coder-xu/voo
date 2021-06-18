import 'package:example/comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/hot_label/index.dart';

///热门标签
class HotLabelView extends StatelessWidget {
  final List<String> list = ['室内设计', '北欧风', '白色', '木', '厨房', '木地板', '天花板', '浴室', '北美工业风','主卧'];

  //内容视图
  Widget contentView() {
    List<Widget> children = [];

    children.add(VooHotLabel(
      title: 'item宽高自适应',
      subTitle: '默认参数',
      list: list,
    ));

    children.add(SizedBox(height: 16));

    children.add(VooHotLabel(
      title: 'item宽高固定',
      titleStyle: TextStyle(fontSize: 28, color: Colors.deepOrange),
      subTitle: '热门标签',
      subTitleStyle: TextStyle(fontSize: 18, color: Colors.blue),
      list: list,
      itemFixed: true,
      itemBgColor: Colors.green,
      itemStyle: TextStyle(fontSize: 14,color: Colors.white),
    ));

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'HotLabelView'),
      body: contentView(),
    );
  }
}
