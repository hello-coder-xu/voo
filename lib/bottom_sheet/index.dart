import 'package:flutter/material.dart';

class VooBottomSheet {
  //底部菜单-列表
  static Future showListView({
    @required BuildContext context,
    List<String> list,
    Color backgroundColor,
    double elevation,
    ShapeBorder shape,
    Clip clipBehavior,
    Color barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings routeSettings,
    bool isTopRound = false,
    Function(String value) onSelect,
    VoidCallback onCancel,
  }) {
    WidgetBuilder builder = (context) => VBottomSheetOptionView(list: list, onSelect: onSelect, onCancel: onCancel);
    return _show(
      context: context,
      builder: builder,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape ?? isTopRound
          ? RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)))
          : null,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      routeSettings: routeSettings,
    );
  }

  static Future showDescribeView({
    @required BuildContext context,
    @required Widget child,
    Color backgroundColor,
    double elevation,
    ShapeBorder shape,
    Clip clipBehavior,
    Color barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings routeSettings,
    bool isTopRound = false,
    VoidCallback onDelete,
    VoidCallback onCancel,
  }) {
    WidgetBuilder builder = (context) => VBottomSheetTextView(child: child, onDelete: onDelete, onCancel: onCancel);
    return _show(
      context: context,
      builder: builder,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape ?? isTopRound
          ? RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)))
          : null,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      routeSettings: routeSettings,
    );
  }

  static Future showCustomView({
    @required BuildContext context,
    @required Widget child,
    Color backgroundColor,
    double elevation,
    ShapeBorder shape,
    Clip clipBehavior,
    Color barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings routeSettings,
    bool isTopRound = false,
    Function(String value) onSelect,
    VoidCallback onCancel,
  }) {
    WidgetBuilder builder = (context) => child;
    return _show(
      context: context,
      builder: builder,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape ?? isTopRound
          ? RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)))
          : null,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      routeSettings: routeSettings,
    );
  }

  static Future _show({
    @required BuildContext context,
    WidgetBuilder builder,
    Color backgroundColor,
    double elevation,
    ShapeBorder shape,
    Clip clipBehavior,
    Color barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings routeSettings,
  }) {
    return showModalBottomSheet(
      context: context,
      builder: builder,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      routeSettings: routeSettings,
    );
  }
}

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
