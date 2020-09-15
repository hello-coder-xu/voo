import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voo/color/index.dart';
import 'package:voo/picker/picker_bean.dart';

class VooPicker extends StatefulWidget {
  final String title;
  final String cancelTxt;
  final String confirmTxt;
  final List<PickerBean> list;
  final Function onCancel;
  final Function(String value) onConfirm;

  VooPicker({
    @required this.list,
    this.title,
    this.cancelTxt,
    this.confirmTxt,
    this.onCancel,
    this.onConfirm,
  });

  @override
  VooPickerState createState() => VooPickerState();
}

class VooPickerState extends State<VooPicker> {
  List<String> value = [];
  List<FixedExtentScrollController> scrolls = [];

  @override
  void initState() {
    super.initState();
    assert(widget.list != null || widget.list.length > 0);

    widget.list.forEach((it) {
      value.add(it.list[it.select]);
      scrolls.add(FixedExtentScrollController(initialItem: it.select));
    });
  }

  Widget cupertinoPickerItem(int index) {
    List<String> list = widget.list[index].list;

    List<Widget> children = [];

    list.forEach((element) {
      children.add(Container(
        alignment: Alignment.center,
        child: Text(element, style: TextStyle(fontSize: 14, color: VooColors.titleColor)),
      ));
    });

    return Expanded(
      child: CupertinoPicker(
        itemExtent: 40,
        scrollController: scrolls[index],
        onSelectedItemChanged: (position) {
          value[index] = list[position];
        },
        children: children,
      ),
    );
  }

  //标题
  Widget titleView() {
    List<Widget> children = [];

    children.add(Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.center,
        child: Text(widget.cancelTxt ?? '取消', style: TextStyle(fontSize: 14, color: VooColors.subTitleColor)),
      ),
    ));

    children.add(Expanded(
      flex: 6,
      child: Container(
        alignment: Alignment.center,
        child: Text(widget.title ?? '', style: TextStyle(fontSize: 16, color: VooColors.titleColor)),
      ),
    ));

    children.add(Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onConfirm,
        child: Container(
          alignment: Alignment.center,
          child: Text(widget.confirmTxt ?? '確認', style: TextStyle(fontSize: 14, color: VooColors.accentColor)),
        ),
      ),
    ));

    return Container(
      height: 40,
      color: Colors.white,
      child: Row(children: children),
    );
  }

  Widget contentCupertionPickerView() {
    List<Widget> children = [];
    List.generate(widget.list.length, (index) {
      children.add(cupertinoPickerItem(index));
    });
    return Container(
      height: 200,
      color: Colors.white,
      child: Row(children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(titleView());
    children.add(Divider(height: 1));
    children.add(contentCupertionPickerView());
    return IntrinsicHeight(child: Column(children: children));
  }

  void onConfirm() {
    if (widget.onConfirm != null) {
      String tempValue = value.join('-');
      widget.onConfirm(tempValue);
    }
  }

  @override
  void dispose() {
    scrolls.forEach((element) {
      element.dispose();
    });
    super.dispose();
  }
}
