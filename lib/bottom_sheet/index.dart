import 'package:flutter/material.dart';

///列表选择视图
class VBottomSheetOptionView extends StatelessWidget {
  final List<String> list;
  final String initData;
  final double maxHeight;
  final double minHeight;
  final Function(String value) onSelect;
  final Function onCancel;

  VBottomSheetOptionView({
    this.list,
    this.initData,
    this.maxHeight = 0.8,
    this.minHeight = 0.1,
    this.onSelect,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(contentView(context));
    children.add(bottomView(context));

    return IntrinsicHeight(child: Column(children: children));
  }

  Widget contentView(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < list.length; i++) {
      if (children.length > 0) {
        children.add(Divider(height: 1));
      }
      String it = list[i];
      children.add(ListTile(
        onTap: () => onItemClick(context, it),
        title: Text(it, textAlign: TextAlign.center),
        selected: it == initData,
      ));
    }

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * maxHeight,
        minHeight: MediaQuery.of(context).size.height * minHeight,
      ),
      child: SingleChildScrollView(
        child: Column(children: children),
      ),
    );
  }

  Widget bottomView(BuildContext context) {
    List<Widget> children = [];

    final Color effectiveColor = DividerTheme.of(context).color ?? Theme.of(context).dividerColor;
    children.add(Container(height: 8, color: effectiveColor));

    children.add(GestureDetector(
      onTap: () => onCancelTap(context),
      child: Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        color: Colors.white,
        child: Text('取消', style: TextStyle(fontSize: 16)),
      ),
    ));

    return Column(children: children);
  }

  void onItemClick(BuildContext context, String value) {
    if (onSelect != null) {
      onSelect(value);
    }
    close(context);
  }

  void onCancelTap(BuildContext context) {
    if (onCancel != null) {
      onCancel();
    }
    close(context);
  }

  void close(BuildContext context) {
    Navigator.pop(context);
  }
}

///文本视图
class VBottomSheetTextView extends StatelessWidget {
  final Widget child;
  final double maxHeight;
  final double minHeight;
  final VoidCallback onDelete;
  final VoidCallback onCancel;

  VBottomSheetTextView({
    this.child,
    this.maxHeight = 0.8,
    this.minHeight = 0.1,
    this.onDelete,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    children.add(child);
    children.add(Divider(height: 1));
    children.add(GestureDetector(
      onTap: () => onDeleteTap(context),
      child: Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        color: Colors.white,
        child: Text('刪除', style: TextStyle(color: Colors.red, fontSize: 16)),
      ),
    ));
    final Color effectiveColor = DividerTheme.of(context).color ?? Theme.of(context).dividerColor;
    children.add(Container(height: 8, color: effectiveColor));

    children.add(GestureDetector(
      onTap: () => onCancelTap(context),
      child: Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        color: Colors.white,
        child: Text('取消', style: TextStyle(fontSize: 16)),
      ),
    ));

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * maxHeight,
        minHeight: MediaQuery.of(context).size.height * minHeight,
      ),
      child: IntrinsicHeight(child: Column(children: children)),
    );
  }

  void onDeleteTap(BuildContext context) {
    if (onDelete != null) {
      onDelete();
    }
    close(context);
  }

  void onCancelTap(BuildContext context) {
    if (onCancel != null) {
      onCancel();
    }
    close(context);
  }

  void close(BuildContext context) {
    Navigator.pop(context);
  }
}

///自定义视图
class VBottomSheetCustomView extends StatelessWidget {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  VBottomSheetCustomView({
    this.child,
    this.maxHeight = 0.8,
    this.minHeight = 0.1,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * maxHeight,
        minHeight: MediaQuery.of(context).size.height * minHeight,
      ),
      child: IntrinsicHeight(child: child),
    );
  }
}
