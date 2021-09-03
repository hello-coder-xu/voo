import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// build widget when button is changing
typedef ButtonWidgetBuilder = Widget Function(bool switchOn);

/// callback when button is clicking
typedef OnButtonSwitch = Function(bool switchOn);

enum WidgetOrientation { Vertical, Horizontal }

class AnimatedTextButton extends StatefulWidget {
  /// text to show on button
  final String text;

  /// text style to show on button
  final TextStyle style;

  /// size of animated widget
  final double size;

  /// true when the button switch on
  final bool switchOn;

  /// animation duration to change state
  final Duration duration;

  /// tap call back of button
  final OnButtonSwitch? onTap;

  /// builder to create button
  final ButtonWidgetBuilder? buttonBuilder;

  /// Arrangement direction for button and text
  final WidgetOrientation orientation;

  const AnimatedTextButton({
    Key? key,
    required this.text,
    this.style: const TextStyle(),
    this.size: 30.0,
    this.switchOn: true,
    this.duration: const Duration(milliseconds: 1000),
    this.orientation: WidgetOrientation.Horizontal,
    this.onTap,
    this.buttonBuilder,
  }) : super(key: key);

  @override
  _AnimatedTextButtonState createState() => _AnimatedTextButtonState();
}

class _AnimatedTextButtonState extends State<AnimatedTextButton> {
  final ButtonController controller = ButtonController();
  bool _switchOn = false;

  @override
  void initState() {
    super.initState();
    _switchOn = widget.switchOn;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.onTap();
        _switchOn = !_switchOn;
        widget.onTap?.call(_switchOn);
      },
      child: AbsorbPointer(
        child: renderTextButton(),
      ),
    );
  }

  Widget renderTextButton() {
    if (widget.orientation == WidgetOrientation.Horizontal) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedButton(
            controller: controller,
            size: widget.size,
            switchOn: _switchOn,
            duration: widget.duration,
            buttonBuilder: widget.buttonBuilder,
          ),
          SizedBox(width: 6),
          Text(widget.text, style: widget.style),
        ],
      );
    }
    return Column(children: [
      AnimatedButton(
        controller: controller,
        size: widget.size,
        switchOn: _switchOn,
        duration: widget.duration,
        buttonBuilder: widget.buttonBuilder,
      ),
      Text(widget.text, style: widget.style),
    ]);
  }
}

class AnimatedButton extends StatefulWidget {
  /// use this controller to handle tap action
  final ButtonController? controller;

  /// size of animated widget
  final double size;

  /// true when the button switch on
  final bool switchOn;

  /// animation duration to change state
  final Duration duration;

  /// tap call back of button
  final OnButtonSwitch? onTap;

  /// builder to create button
  final ButtonWidgetBuilder? buttonBuilder;

  const AnimatedButton({
    Key? key,
    this.controller,
    this.size: 30.0,
    this.switchOn: true,
    this.duration = const Duration(milliseconds: 1000),
    this.onTap,
    this.buttonBuilder,
  }) : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  bool _switchOn = false;

  @override
  void initState() {
    super.initState();
    _switchOn = widget.switchOn;
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _initAnimations();
  }

  @override
  void didUpdateWidget(AnimatedButton oldWidget) {
    if (_switchOn != widget.switchOn) {
      _switchOn = widget.switchOn;
      _controller = AnimationController(duration: widget.duration, vsync: this);
      _initAnimations();

      super.didUpdateWidget(oldWidget);
    }
    // 绑定控制器
    if (widget.controller != null)
      widget.controller!._bindAnimatedButtonState(this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: _createSwitchAnimatedBuilder(),
    );
  }

  Widget _createSwitchAnimatedBuilder() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (c, w) {
        var buttonWidget = widget.buttonBuilder?.call((_switchOn)) ??
            _defaultWidgetBuilder((_switchOn), widget.size);
        return Stack(
          clipBehavior: Clip.antiAlias,
          children: <Widget>[
            Container(
              width: widget.size,
              height: widget.size,
              alignment: Alignment.center,
              child: Transform.scale(
                scale: (_switchOn && _controller.isAnimating)
                    ? _scaleAnimation.value
                    : 1.0,
                child: Opacity(
                  opacity: (_switchOn && _controller.isAnimating)
                      ? _opacityAnimation.value
                      : 1,
                  child: SizedBox(
                    child: buttonWidget,
                    height: widget.size,
                    width: widget.size,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _defaultWidgetBuilder(bool switchOn, double size) {
    return Icon(
      Icons.favorite,
      color: switchOn ? Colors.redAccent : Colors.grey,
      size: size,
    );
  }

  void _onTap() {
    if (_controller.isAnimating) return;

    if (widget.onTap != null) widget.onTap!(_switchOn);
    _handleSwitchChanged(_switchOn);
  }

  bool _switchState() {
    return _switchOn;
  }

  void _handleSwitchChanged(bool switchOn) {
    if (!mounted) return;
    if (_switchOn == true) {
      _switchOn = !_switchOn;
      setState(() {});
      return;
    }
    if (_switchOn == false) {
      _controller.reset();
      _controller.forward();
      _switchOn = !_switchOn;
      setState(() {});
      return;
    }
  }

  void _initAnimations() {
    _scaleAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 0.3, end: 1.1).chain(
          CurveTween(curve: Curves.bounceOut),
        ),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.1, end: 0.9).chain(
          CurveTween(curve: Curves.bounceOut),
        ),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.9, end: 1.03).chain(
          CurveTween(curve: Curves.bounceOut),
        ),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.03, end: 0.97).chain(
          CurveTween(curve: Curves.bounceOut),
        ),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.97, end: 1.0).chain(
          CurveTween(curve: Curves.bounceOut),
        ),
        weight: 20,
      ),
    ]).animate(_controller);

    _opacityAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 1.0).chain(
          CurveTween(curve: Curves.bounceOut),
        ),
        weight: 60,
      ),
      TweenSequenceItem(tween: ConstantTween<double>(1), weight: 40),
    ]).animate(_controller);
  }
}

class ButtonController {
  void onTap() {
    if (this._animatedButtonState != null) this._animatedButtonState!._onTap();
  }

  bool switchState() {
    if (this._animatedButtonState == null) return false;
    return _animatedButtonState!._switchState();
  }

  // 状态
  _AnimatedButtonState? _animatedButtonState;

  // 绑定状态
  void _bindAnimatedButtonState(_AnimatedButtonState state) {
    this._animatedButtonState = state;
  }

  void dispose() {
    this._animatedButtonState = null;
  }
}
