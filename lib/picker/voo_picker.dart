import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voo/picker/picker_bean.dart';

///选择器
class VooPicker extends StatefulWidget {
  final String? title;
  final String? cancelTxt;
  final String? confirmTxt;
  final TextStyle? style;
  final TextStyle? confirmStyle;
  final TextStyle? cancelStyle;
  final List<PickerBean>? list;
  final Function? onCancel;
  final Function(String value)? onConfirm;

  VooPicker({
    required this.list,
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
    assert(widget.list != null || widget.list!.length > 0);

    widget.list!.forEach((it) {
      value.add(it.list![it.select]);
      scrolls.add(FixedExtentScrollController(initialItem: it.select));
    });
  }

  Widget cupertinoPickerItem(int index) {
    List<String> list = widget.list![index].list!;

    List<Widget> children = [];

    list.forEach((element) {
      children.add(Container(
        alignment: Alignment.center,
        child: Text(
          element,
          style: TextStyle(
            fontSize: 36.sp,
            color: Color(0xff333333),
          ),
        ),
      ));
    });

    return Expanded(
      child: CupertinoPicker(
        itemExtent: 96.h,
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
        child: Text(
          widget.cancelTxt ?? '取消',
          style: widget.cancelStyle ??
              TextStyle(
                fontSize: 32.sp,
                color: Color(0xff999999),
              ),
        ),
      ),
    ));

    children.add(Expanded(
      flex: 6,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          widget.title ?? '',
          style: widget.style ??
              TextStyle(
                fontSize: 32.sp,
                color: Color(0xff333333),
              ),
        ),
      ),
    ));

    children.add(Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onConfirm,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            widget.confirmTxt ?? '確認',
            style: widget.confirmStyle ??
                TextStyle(
                  fontSize: 32.sp,
                  color: Color(0xff25c489),
                ),
          ),
        ),
      ),
    ));

    return Container(
      height: 96.h,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Row(children: children),
    );
  }

  Widget contentCupertionPickerView() {
    List<Widget> children = [];
    List.generate(widget.list!.length, (index) {
      children.add(cupertinoPickerItem(index));
    });
    return Container(
      height: 386.h,
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
      widget.onConfirm!(tempValue);
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
