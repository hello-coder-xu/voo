import 'package:flutter/material.dart';
import 'package:voo/filter/voo_filter_bean.dart';

enum VooFilterContentType { warp, warp_button, list }

///筛选内容
class VooFilterContent extends StatelessWidget {
  //内容数组
  final List<VooFilterBean> filterContentList;
  //取消事件
  final VoidCallback? onCancel;
  //提交事件
  final Function()? onSubmit;
  //选中事件
  final Function(String value)? onSelect;
  //显示样式
  final VooFilterContentType type;
  //最大高度
  final double? maxHeight;

  VooFilterContent({
    required this.filterContentList,
    this.onCancel, //只有在warp_button 类型下可用
    this.onSubmit, //只有在warp_button 类型下可用
    this.onSelect,
    this.maxHeight,
    this.type = VooFilterContentType.warp,
  });

  Widget itemView(BuildContext context, VooFilterBean bean) {
    Widget child;
    double screenWidth = MediaQuery.of(context).size.width;
    double tempWidth = (screenWidth - 5 * 16) / 4;
    switch (type) {
      case VooFilterContentType.warp:
      case VooFilterContentType.warp_button:
        child = Container(
          width: tempWidth,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(3)),
            border: Border.all(color: bean.select ? Colors.green : Colors.grey[200]!, width: 1),
          ),
          alignment: Alignment.center,
          child: Text(
            bean.title,
            style: TextStyle(fontSize: 14, color: bean.select ? Colors.green : Colors.black87),
          ),
        );
        break;
      default:
        List<Widget> children = [];
        children.add(Expanded(
          child: Text(
            bean.title,
            style: TextStyle(fontSize: 14, color: bean.select ? Colors.green : Colors.black87),
          ),
        ));
        if (bean.select) {
          children.add(Icon(Icons.check, color: Colors.green, size: 18));
        }
        child = Container(
          width: double.infinity,
          height: 40,
          color: Colors.white,
          alignment: Alignment.centerLeft,
          child: Row(children: children),
        );
        break;
    }

    return GestureDetector(
      onTap: () => selectTap(bean.title),
      child: child,
    );
  }

  Widget bottomView() {
    List<Widget> children = [];
    children.add(Expanded(
      child: GestureDetector(
        onTap: closeTap,
        child: Container(
          alignment: Alignment.center,
          color: Colors.grey[200],
          child: Text('取消', style: TextStyle(fontSize: 14, color: Colors.black87)),
        ),
      ),
    ));
    children.add(Expanded(
      child: GestureDetector(
        onTap: submitTap,
        child: Container(
          alignment: Alignment.center,
          color: Colors.green,
          child: Text('确认', style: TextStyle(fontSize: 14, color: Colors.white)),
        ),
      ),
    ));

    return Container(
      height: 40,
      child: Row(children: children),
    );
  }

  Widget wrapView(BuildContext context) {
    List<Widget> children = [];
    filterContentList.forEach((element) {
      children.add(itemView(context, element));
    });
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Wrap(
            runSpacing: 16,
            spacing: 16,
            children: children,
          ),
        ),
      ),
    );
  }

  Widget wrapButtonView(BuildContext context) {
    List<Widget> children = [];
    List<Widget> child = [];
    filterContentList.forEach((element) {
      child.add(itemView(context, element));
    });
    children.add(Scrollbar(
      child: SingleChildScrollView(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: EdgeInsets.all(16),
        child: Wrap(
          runSpacing: 16,
          spacing: 16,
          children: child,
        ),
      ),
    ));
    children.add(bottomView());
    return Container(
      color: Colors.white,
      child: IntrinsicHeight(child: Column(children: children)),
    );
  }

  Widget listView(BuildContext context) {
    List<Widget> children = [];
    filterContentList.forEach((element) {
      if (children.length > 0) {
        children.add(Divider(height: 1, color: Colors.grey[200]));
      }
      children.add(itemView(context, element));
    });
    return Container(
      color: Colors.white,
      child: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: children),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (type) {
      case VooFilterContentType.warp:
        child = wrapView(context);
        break;
      case VooFilterContentType.warp_button:
        child = wrapButtonView(context);
        break;
      default:
        child = listView(context);
        break;
    }
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.5,
        minHeight: 100,
      ),
      child: child,
    );
  }

  void selectTap(String title) {
    if (onSelect != null) {
      onSelect!(title);
    }
  }

  void closeTap() {
    if (onCancel != null) {
      onCancel!();
    }
  }

  void submitTap() {
    if (onSubmit != null) {
      onSubmit!();
    }
  }
}
