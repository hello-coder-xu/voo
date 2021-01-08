import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voo/picker/picker_bean.dart';

class VooPicker extends StatefulWidget {
  final String title;
  final String cancelTxt;
  final String confirmTxt;
  final TextStyle style;
  final TextStyle confirmStyle;
  final TextStyle cancelStyle;
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
    this.style,
    this.confirmStyle,
    this.cancelStyle,
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
        child: Text(
          element,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(36),
            color: Color(0xff333333),
          ),
        ),
      ));
    });

    return Expanded(
      child: CupertinoPicker(
        itemExtent: ScreenUtil().setHeight(96),
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

    children.add(Container(
      alignment: Alignment.center,
      child: Text(
        widget.cancelTxt ?? '取消',
        style: widget.cancelStyle ??
            TextStyle(
              fontSize: ScreenUtil().setSp(32),
              color: Color(0xff999999),
            ),
      ),
    ));

    children.add(Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          widget.title ?? '',
          style: widget.style ??
              TextStyle(
                fontSize: ScreenUtil().setSp(32),
                color: Color(0xff333333),
              ),
        ),
      ),
    ));

    children.add(GestureDetector(
      onTap: onConfirm,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          widget.confirmTxt ?? '確認',
          style: widget.confirmStyle ??
              TextStyle(
                fontSize: ScreenUtil().setSp(32),
                color: Color(0xff25c489),
              ),
        ),
      ),
    ));

    return Container(
      height: ScreenUtil().setHeight(96),
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
      child: Row(children: children),
    );
  }

  Widget contentCupertionPickerView() {
    List<Widget> children = [];
    List.generate(widget.list.length, (index) {
      children.add(cupertinoPickerItem(index));
    });
    return Container(
      height: ScreenUtil().setHeight(386),
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
