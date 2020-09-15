import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voo/color/index.dart';
import 'package:voo/picker/picker_linkage_bean.dart';

///联动picker
class VooLinkagePicker extends StatefulWidget {
  final String title;
  final String cancelTxt;
  final String confirmTxt;
  final PickerLinkageBean bean;
  final Function onCancel;
  final Function(String value) onConfirm;

  VooLinkagePicker({
    @required this.bean,
    this.title,
    this.cancelTxt,
    this.confirmTxt,
    this.onCancel,
    this.onConfirm,
  }) : assert(bean != null);

  @override
  VooLinkagePickerState createState() => VooLinkagePickerState();
}

class VooLinkagePickerState extends State<VooLinkagePicker> {
  List<FixedExtentScrollController> scrolls;
  PickerLinkageBean currentBean;

  @override
  void initState() {
    super.initState();
    currentBean = widget.bean;
    initData(currentBean);
  }

  Widget cupertinoPickerItem(int index, PickerLinkageBean bean) {
    List<Widget> children = [];

    bean.child?.forEach((element) {
      children.add(Container(
        alignment: Alignment.center,
        child: Text(element.title, style: TextStyle(fontSize: 14, color: VooColors.titleColor)),
      ));
    });

    return Expanded(
      child: CupertinoPicker(
        itemExtent: 40,
        scrollController: scrolls[index],
        onSelectedItemChanged: (position) => onSelectedItemChanged(index, position, bean),
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

  List<Widget> getCupertinoPickerChildren(int index, PickerLinkageBean bean) {
    List<Widget> children = [];
    if (bean.child != null && bean.child.length > 0) {
      children.add(cupertinoPickerItem(index, bean));
      children.addAll(getCupertinoPickerChildren(++index, bean.child[bean.select]));
    }
    return children;
  }

  Widget contentCupertinoPickerView() {
    List<Widget> children = getCupertinoPickerChildren(0, currentBean);
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
    children.add(contentCupertinoPickerView());
    return IntrinsicHeight(child: Column(children: children));
  }

  ///初始化数据
  void initData(PickerLinkageBean bean) {
    scrolls = initScroll(bean);
  }

  ///初始化scroll
  List<FixedExtentScrollController> initScroll(PickerLinkageBean bean) {
    List<FixedExtentScrollController> children = [];
    if (bean.child != null) {
      children.add(FixedExtentScrollController(initialItem: bean.select));
      children.addAll(initScroll(bean.child[bean.select]));
    }
    return children;
  }

  ///重置子视图选择
  void changeChildValue(PickerLinkageBean bean) {
    bean.child?.forEach((element) {
      element.select = 0;
      changeChildValue(element);
    });
  }

  ///改变数据
  void onSelectedItemChanged(int index, int position, PickerLinkageBean bean) {
    bean.select = position;
    changeChildValue(bean);
    List.generate(scrolls.length - index - 1, (tempIndex) {
      scrolls[tempIndex + index + 1].jumpTo(0);
    });
    if (mounted) setState(() {});
  }

  ///获取数据
  List<String> getValue(PickerLinkageBean bean) {
    List<String> children = [];
    if (bean.title != null) {
      children.add(bean.title);
    }
    if (bean.child != null) {
      children.addAll(getValue(bean.child[bean.select]));
    }
    return children;
  }

  void onConfirm() {
    if (widget.onConfirm != null) {
      String tempValue = getValue(currentBean).join('-');
      widget.onConfirm(tempValue);
    }
  }

  @override
  void dispose() {
    scrolls?.forEach((element) {
      element.dispose();
    });
    super.dispose();
  }
}
