import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/voo.dart';

///折叠视图
class CollapsePage extends StatefulWidget {
  @override
  CollapsePageState createState() => CollapsePageState();
}

class CollapsePageState extends State<CollapsePage> {
  int type = 0;

  //内容视图
  Widget contentView() {
    List<Widget> children = [];

    children.add(UiComponent.getListTile(title: '基础用法'));

    children.add(VooGroupCollapse(
      children: [
        VooCollapseBean(
          title: Text('一级分类'),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.white,
            child: Text('业主提供的房屋信息业主提供的，房屋信息业主提供，的房屋信息业主提供的房屋信息。业主提供的房屋信息业主，提供的房屋信息业主提供的房屋信息'),
          ),
          initiallyExpanded: false,
        ),
        VooCollapseBean(
          title: Text('一级分类'),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.white,
            child: Text('业主提供的房屋信息业主提供的，房屋信息业主提供，的房屋信息业主提供的房屋信息。业主提供的房屋信息业主，提供的房屋信息业主提供的房屋信息'),
          ),
          initiallyExpanded: false,
        )
      ],
      onExpansionChanged: (index, value) {
        print('test index=$index expanded=$value');
      },
    ));

    children.add(UiComponent.getListTile(
      title: '手风琴模式',
      subTitle: Text(
        '一种特殊的折叠面板，值允许单个内容区展开',
        style: TextStyle(fontSize: 12, color: Colors.blue),
      ),
    ));

    children.add(VooGroupCollapse(
      children: [
        VooCollapseBean(
          title: Text('一级分类'),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.white,
            child: Text('业主提供的房屋信息业主提供的，房屋信息业主提供，的房屋信息业主提供的房屋信息。业主提供的房屋信息业主，提供的房屋信息业主提供的房屋信息'),
          ),
          initiallyExpanded: false,
        ),
        VooCollapseBean(
          title: Text('一级分类'),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.white,
            child: Text('业主提供的房屋信息业主提供的，房屋信息业主提供，的房屋信息业主提供的房屋信息。业主提供的房屋信息业主，提供的房屋信息业主提供的房屋信息'),
          ),
        ),
        VooCollapseBean(
          title: Text('一级分类'),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.white,
            child: Text('业主提供的房屋信息业主提供的，房屋信息业主提供，的房屋信息业主提供的房屋信息。业主提供的房屋信息业主，提供的房屋信息业主提供的房屋信息'),
          ),
        )
      ],
      isAccordion: true,
      onExpansionChanged: (index, value) {
        print('test index=$index expanded=$value');
      },
    ));

    return SingleChildScrollView(child: Column(children: children));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'CollapsePreview'),
      body: contentView(),
    );
  }
}
