import '../../comm/ui_component.dart';
import 'package:flutter/material.dart';
import 'package:voo/color/index.dart';
import 'package:voo/icon/index.dart';

///图标
class IconPage extends StatelessWidget {
  final List<Map<String, IconData>> list = [
    {'she ': VooIcon.she},
    {'ji ': VooIcon.ji},
    {'zhao ': VooIcon.zhao},
    {'ta ': VooIcon.ta},
    {'more ': VooIcon.more},
    {'arrow_down ': VooIcon.arrow_down},
    {'arrow_left ': VooIcon.arrow_left},
    {'arrow_right ': VooIcon.arrow_right},
    {'arrow_up ': VooIcon.arrow_up},
    {'play ': VooIcon.play},
    {'filter ': VooIcon.filter},
    {'comment ': VooIcon.comment},
    {'fire ': VooIcon.fire},
    {'download ': VooIcon.download},
    {'share_line ': VooIcon.share_line},
    {'close ': VooIcon.close},
    {'plus ': VooIcon.plus},
    {'search ': VooIcon.search},
    {'play_fill': VooIcon.play_fill},
    {'close_fill ': VooIcon.close_fill},
    {'address ': VooIcon.address},
    {'favor_fill ': VooIcon.favor_fill},
    {'favor ': VooIcon.favor},
    {'star ': VooIcon.star},
    {'star_fill ': VooIcon.star_fill},
    {'sms ': VooIcon.sms},
    {'tel ': VooIcon.tel},
    {'tel_round ': VooIcon.tel_round},
    {'sms_round ': VooIcon.sms_round},
    {'fb ': VooIcon.fb},
    {'line ': VooIcon.line},
    {'youtube ': VooIcon.youtube},
    {'tick ': VooIcon.tick},
    {'avatar ': VooIcon.avatar},
    {'arrow_left_round ': VooIcon.arrow_left_round},
    {'company ': VooIcon.company},
    {'av ': VooIcon.av},
    {'high_quality ': VooIcon.high_quality},
    {'article ': VooIcon.article},
    {'atlas_select ': VooIcon.atlas_select},
    {'atlas ': VooIcon.atlas},
    {'image ': VooIcon.image_select},
    {'image ': VooIcon.image},
    {'home ': VooIcon.home},
    {'home_select ': VooIcon.home_select},
    {'select_down ': VooIcon.select_down},
    {'mine ': VooIcon.mine},
    {'mine_select ': VooIcon.mine_select},
    {'phone ': VooIcon.phone},
    {'refresh ': VooIcon.refresh},
    {'message_more ': VooIcon.message_more},
    {'share ': VooIcon.share},
    {'tag ': VooIcon.tag},
    {'works ': VooIcon.works},
    {'send_fill ': VooIcon.send_fill},
    {'send ': VooIcon.send},
    {'collection ': VooIcon.collection},
    {'design ': VooIcon.design},
    {'decorate ': VooIcon.decorate},
    {'message_select ': VooIcon.message_select},
    {'message ': VooIcon.message},
    {'refresh_round ': VooIcon.refresh_round},
    {'password ': VooIcon.password},
    {'safe ': VooIcon.safe},
    {'setting ': VooIcon.setting},
    {'view ': VooIcon.view},
    {'close_eye ': VooIcon.close_eye},
  ];

  ///item 视图
  Widget itemView({Map<String, IconData> map}) {
    List<Widget> children = [];
    map.forEach((title, icon) {
      children.add(Icon(icon));
      children.add(SizedBox(height: 4));
      children.add(Text(title, style: TextStyle(fontSize: 12, color: VooColors.subTitleColor)));
    });
    return Column(children: children);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiComponent.getTitleBar(title: ' IconsPreview'),
      body: GridView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (BuildContext context, int index) => itemView(map: list[index]),
      ),
    );
  }
}
