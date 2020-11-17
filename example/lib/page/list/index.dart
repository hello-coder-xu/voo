import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/cell/index.dart';
import 'package:voo/cell/voo_cell_field.dart';
import 'package:voo/color/index.dart';
import 'package:voo/field/index.dart';
import 'package:voo/icon/index.dart';
import 'package:voo/picker/picker_bean.dart';
import 'package:voo/picker/voo_picker.dart';
import 'package:voo/voo.dart';

///列表页面
class ListPage extends StatefulWidget {
  @override
  ListPageState createState() => ListPageState();
}

class ListPageState extends State<ListPage> {
  String cityValue = '';
  String houseValue = '';

  //双行视图
  Widget doubleLineView({String title, String subTitle}) {
    List<Widget> children = [];

    children.add(Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    ));
    children.add(SizedBox(width: 16));
    children.add(Expanded(
      child: Container(
        constraints: BoxConstraints(minHeight: 40),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 16, color: Colors.black87)),
            Text(subTitle, style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    ));

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      constraints: BoxConstraints(minHeight: 56),
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: Row(children: children),
    );
  }

  //feed视图
  Widget feedView({String title, String subTitle}) {
    List<Widget> children = [];
    children.add(Expanded(
      child: Container(
        constraints: BoxConstraints(minHeight: 40),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 16, color: Colors.black87)),
            Text(subTitle, style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    ));
    children.add(SizedBox(width: 16));
    children.add(Container(
      width: 96,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    ));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      constraints: BoxConstraints(minHeight: 56),
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: Row(children: children),
    );
  }

  //内容
  Widget contentView() {
    List<Widget> children = [];

    children.add(UiComponent.getListTile(title: '输入组合'));
    children.add(VooCellField(
      title: Text('昵称', style: TextStyle(fontSize: 16)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入昵称',
        ),
      ),
      paddingWidth: 48,
    ));
    children.add(Divider(height: 1));
    children.add(VooCellField(
      title: Text('联系方式', style: TextStyle(fontSize: 16)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入手机号码',
        ),
      ),
      paddingWidth: 16,
    ));

    children.add(UiComponent.getListTile(title: '输入与弹出或跳转组合'));
    children.add(VooCellField(
      title: Text('房屋面积', style: TextStyle(fontSize: 16)),
      child: VooField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入您要设计的房屋坪数',
        ),
      ),
      paddingWidth: 16,
    ));

    bool hasSelect = cityValue.length != 0;
    children.add(Divider(height: 1));
    children.add(VooCellField(
      title: Text('所在城市', style: TextStyle(fontSize: 16)),
      child: GestureDetector(
        onTap: showCityMenu,
        behavior: HitTestBehavior.translucent,
        child: Container(
          width: double.infinity,
          child: Text(
            hasSelect ? cityValue : '点击选择所在城市',
            style: TextStyle(
              color: hasSelect ? Colors.black87 : Colors.grey,
            ),
          ),
        ),
      ),
    ));

    bool hasHouseSelect = houseValue.length != 0;
    children.add(Divider(height: 1));
    children.add(VooCellField(
      title: Text('房屋格局', style: TextStyle(fontSize: 16)),
      child: GestureDetector(
        onTap: showHouseMenu,
        behavior: HitTestBehavior.translucent,
        child: Container(
          width: double.infinity,
          child: Text(
            hasHouseSelect ? houseValue : '点击选择房屋格局、屋况',
            style: TextStyle(
              color: hasHouseSelect ? Colors.black87 : Colors.grey,
            ),
          ),
        ),
      ),
    ));

    children.add(UiComponent.getListTile(title: '图标+标题组合'));
    children.add(VooCell(
      leading: Padding(
        padding: EdgeInsets.only(right: 8),
        child: Icon(Icons.settings, size: 18, color: VooColors.subTitleColor),
      ),
      title: Text('我看过的'),
      trailing: Icon(VooIcon.arrow_right, size: 16, color: VooColors.subTitleColor),
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      leading: Padding(
        padding: EdgeInsets.only(right: 8),
        child: Icon(Icons.message, size: 18, color: VooColors.subTitleColor),
      ),
      title: Text('我的消息'),
      value: VooBadge(
        child: '10',
        isPoint: false,
      ),
      trailing: Icon(VooIcon.arrow_right, size: 16, color: VooColors.subTitleColor),
    ));
    children.add(Divider(height: 1));
    children.add(VooCell(
      leading: Padding(
        padding: EdgeInsets.only(right: 8),
        child: Icon(Icons.feedback, size: 18, color: VooColors.subTitleColor),
      ),
      title: Text('意见反馈'),
      value: Text('5.3.7', style: TextStyle(fontSize: 14, color: Colors.grey)),
      trailing: Icon(VooIcon.arrow_right, size: 16, color: VooColors.subTitleColor),
    ));

    children.add(UiComponent.getListTile(title: '双行组合'));
    children.add(doubleLineView(
      title: '蕴意室内设计',
      subTitle: '浏览数：1w',
    ));
    children.add(Divider(height: 1));
    children.add(doubleLineView(
      title: '好室佳设计',
      subTitle: '浏览数：8.5k',
    ));

    children.add(UiComponent.getListTile(title: 'FEED组合'));
    children.add(feedView(
      title: '这十种室内香水，搞定睡的香又甜',
      subTitle: '浏览数：1w点赞数：1w',
    ));
    children.add(Divider(height: 1));
    children.add(feedView(
      title: '有套漂亮床单，卧室变美不是问题',
      subTitle: '浏览数：8.5k',
    ));
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 32),
      child: Column(children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: 'ListPreview'),
      body: contentView(),
    );
  }

  void showCityMenu() {
    showModalBottomSheet(
      context: context,
      builder: (context) => VooPicker(
        list: [
          PickerBean(list: ['杭州', '宁波', '温州', '嘉兴', '湖州'])
        ],
        title: '城市',
        onConfirm: (value) {
          cityValue = value;
          if (mounted) setState(() {});
          Navigator.pop(context);
        },
      ),
    );
  }

  void showHouseMenu() {
    showModalBottomSheet(
      context: context,
      builder: (context) => VooPicker(
        list: [
          PickerBean(list: ['1房', '2房', '3房', '4房', '5房']),
          PickerBean(list: ['1厅', '2厅', '3厅']),
          PickerBean(list: ['新屋', '老屋', '毛坯', '中古屋', '自地自建'])
        ],
        title: '房型',
        onConfirm: (value) {
          houseValue = value;
          if (mounted) setState(() {});
          Navigator.pop(context);
        },
      ),
    );
  }
}
