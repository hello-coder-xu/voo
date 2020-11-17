import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';

///布局
class LayoutPage extends StatelessWidget {
  //item 视图
  Widget itemView({String title, double width, Color color = Colors.blue}) {
    return Container(
      alignment: Alignment.center,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 8),
      color: color,
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.white)),
    );
  }

  //内容视图
  Widget contentView() {
    List<Widget> children = [];

    children.add(UiComponent.getListTile(title: '基础用法'));
    children.add(Container(
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(child: itemView(title: 'flex: 1')),
          Expanded(child: itemView(title: 'flex: 1', color: Colors.blue[300])),
          Expanded(child: itemView(title: 'flex: 1')),
        ],
      ),
    ));

    children.add(Container(
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(child: itemView(title: 'flex: 1')),
          Expanded(
            flex: 4,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              alignment: Alignment.center,
              child: itemView(title: 'flex: 1,Alignment.center', color: Colors.blue[300]),
            ),
          ),
        ],
      ),
    ));

    children.add(Container(
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          itemView(title: 'Row MainAxisAlignment.end'),
        ],
      ),
    ));

    children.add(UiComponent.getListTile(title: '在元素之间增加间距'));

    children.add(Container(
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(child: itemView(title: 'flex: 1')),
          SizedBox(width: 16),
          Expanded(child: itemView(title: 'flex: 1', color: Colors.blue[300])),
          SizedBox(width: 16),
          Expanded(child: itemView(title: 'flex: 1')),
        ],
      ),
    ));

    children.add(UiComponent.getListTile(title: 'Flex布局'));
    children.add(Container(
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          itemView(title: 'a'),
          itemView(title: 'b', color: Colors.blue[300]),
          itemView(title: 'c'),
        ],
      ),
    ));

    children.add(Container(
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          itemView(title: 'a', width: 60),
          itemView(title: 'b', width: 60, color: Colors.blue[300]),
          itemView(title: 'c', width: 60),
        ],
      ),
    ));
    children.add(Container(
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          itemView(title: 'a', width: 60),
          itemView(title: 'b', width: 60, color: Colors.blue[300]),
          itemView(title: 'c', width: 60),
        ],
      ),
    ));

    children.add(Container(
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          itemView(title: 'a', width: 60),
          itemView(title: 'b', width: 60, color: Colors.blue[300]),
          itemView(title: 'c', width: 60),
        ],
      ),
    ));

    children.add(Container(
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          itemView(title: 'a', width: 60),
          itemView(title: 'b', width: 60, color: Colors.blue[300]),
          itemView(title: 'c', width: 60),
        ],
      ),
    ));

    return SingleChildScrollView(child: Column(children: children));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'Col'),
      body: contentView(),
    );
  }
}
