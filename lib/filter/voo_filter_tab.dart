import 'package:flutter/material.dart';
import 'package:voo/filter/voo_filter_bean.dart';

///
class VooFilterTab extends StatelessWidget {
  final List<VooFilterBean> list;
  final Function(int index) onSelect;

  VooFilterTab({@required this.list, this.onSelect});

  //item 视图
  Widget itemTabView({VooFilterBean bean, VoidCallback onTap}) {
    List<Widget> children = [];
    children.add(Flexible(
      child: Text(
        bean.title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14, color: bean.select ? Colors.green : Colors.black87),
        overflow: TextOverflow.ellipsis,
      ),
    ));
    children.add(SizedBox(width: 4));
    children.add(Icon(
      bean.select ? Icons.arrow_drop_up : Icons.arrow_drop_down,
      color: bean.select ? Colors.green : Colors.black87,
    ));
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        height: 40,
        child: Row(
          children: children,
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    list.forEach((element) {
      children.add(Expanded(
        child: itemTabView(
          bean: element,
          onTap: () => onSelect(list.indexOf(element)),
        ),
      ));
    });
    return Row(children: children);
  }
}
