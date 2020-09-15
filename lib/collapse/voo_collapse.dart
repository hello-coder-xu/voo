import 'package:flutter/material.dart';
import 'package:voo/cell/index.dart';

///折叠视图
class VooCollapse extends StatefulWidget {
  final bool initiallyExpanded;
  final ValueChanged<bool> onExpansionChanged;
  final Text title;
  final Widget child;

  VooCollapse({
    GlobalKey key,
    @required this.title,
    @required this.child,
    this.initiallyExpanded = false,
    this.onExpansionChanged,
  }) : super(key: key);

  @override
  VooCollapseState createState() => VooCollapseState();
}

class VooCollapseState extends State<VooCollapse> with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);
  AnimationController _controller;
  Animation<double> _iconTurns;
  Animation<double> _heightFactor;

  bool isExpanded = false;

  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    isExpanded = PageStorage.of(context)?.readState(context) as bool ?? widget.initiallyExpanded;
    if (isExpanded) _controller.value = 1.0;
  }

  Widget _buildChildren(BuildContext context, Widget child) {
    List<Widget> children = [];
    children.add(VooCell(
      title: widget.title ?? Text(''),
      alignment: CrossAxisAlignment.center,
      trailing: RotationTransition(
        turns: _iconTurns,
        child: const Icon(Icons.arrow_drop_down),
      ),
      onTap: onHeaderTap,
    ));
    children.add(ClipRect(
      child: Align(
        alignment: Alignment.center,
        heightFactor: _heightFactor.value,
        child: child,
      ),
    ));
    return Container(
      child: Column(mainAxisSize: MainAxisSize.min, children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !isExpanded && _controller.isDismissed;

    Widget result = Offstage(
      child: TickerMode(
        child: widget.child,
        enabled: !closed,
      ),
      offstage: closed,
    );
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: result,
    );
  }

  void onHeaderTap() {
    setState(() {
      isExpanded = !isExpanded;

      if (isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then((value) {
          if (!mounted) return;
          setState(() {});
        });
      }
      PageStorage.of(context)?.writeState(context, isExpanded);
    });
    if (widget.onExpansionChanged != null) widget.onExpansionChanged(isExpanded);
  }

  //来自父控件的通知
  void notificationByParent({bool expanded = false}) {
    setState(() {
      isExpanded = expanded;
      if (isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then((value) {
          if (!mounted) return;
          setState(() {});
        });
      }
      PageStorage.of(context)?.writeState(context, isExpanded);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
