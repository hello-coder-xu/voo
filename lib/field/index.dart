import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:voo/icon/index.dart';

///输入框
class VooField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final InputDecoration decoration;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle style;
  final StrutStyle strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final TextDirection textDirection;
  final bool autofocus;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType smartDashesType;
  final SmartQuotesType smartQuotesType;
  final bool enableSuggestions;
  final int maxLines;
  final int minLines;
  final bool expands;
  final bool readOnly;
  final ToolbarOptions toolbarOptions;
  final bool showCursor;
  static const int noMaxLength = -1;
  final int maxLength;
  final bool maxLengthEnforced;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final Radius cursorRadius;
  final Color cursorColor;
  final BoxHeightStyle selectionHeightStyle;
  final BoxWidthStyle selectionWidthStyle;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final DragStartBehavior dragStartBehavior;

  bool get selectionEnabled => enableInteractiveSelection;
  final GestureTapCallback onTap;
  final MouseCursor mouseCursor;
  final InputCounterWidgetBuilder buildCounter;
  final ScrollPhysics scrollPhysics;
  final ScrollController scrollController;
  final Iterable<String> autofillHints;
  final bool showClear;
  final bool showPwd;

  VooField({
    Key key,
    this.showClear = false,
    this.showPwd = false,
    this.controller,
    this.focusNode,
    this.decoration = const InputDecoration(),
    TextInputType keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    ToolbarOptions toolbarOptions,
    this.showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    SmartDashesType smartDashesType,
    SmartQuotesType smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforced = true,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.cursorColor,
    this.selectionHeightStyle = BoxHeightStyle.tight,
    this.selectionWidthStyle = BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection = true,
    this.onTap,
    this.mouseCursor,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints,
  })  : assert(textAlign != null),
        assert(readOnly != null),
        assert(autofocus != null),
        assert(obscuringCharacter != null && obscuringCharacter.length == 1),
        assert(obscureText != null),
        assert(autocorrect != null),
        smartDashesType = smartDashesType ?? (obscureText ? SmartDashesType.disabled : SmartDashesType.enabled),
        smartQuotesType = smartQuotesType ?? (obscureText ? SmartQuotesType.disabled : SmartQuotesType.enabled),
        assert(enableSuggestions != null),
        assert(enableInteractiveSelection != null),
        assert(maxLengthEnforced != null),
        assert(scrollPadding != null),
        assert(dragStartBehavior != null),
        assert(selectionHeightStyle != null),
        assert(selectionWidthStyle != null),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        assert(expands != null),
        assert(
          !expands || (maxLines == null && minLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(!obscureText || maxLines == 1, 'Obscured fields cannot be multiline.'),
        assert(maxLength == null || maxLength == TextField.noMaxLength || maxLength > 0),
        assert(
            !identical(textInputAction, TextInputAction.newline) ||
                maxLines == 1 ||
                !identical(keyboardType, TextInputType.text),
            'Use keyboardType TextInputType.multiline when using TextInputAction.newline on a multiline TextField.'),
        keyboardType = keyboardType ?? (maxLines == 1 ? TextInputType.text : TextInputType.multiline),
        toolbarOptions = toolbarOptions ??
            (obscureText
                ? const ToolbarOptions(selectAll: true, paste: true)
                : const ToolbarOptions(copy: true, cut: true, selectAll: true, paste: true)),
        super(key: key);

  @override
  VooFieldState createState() => VooFieldState();
}

class VooFieldState extends State<VooField> {
  bool show = false;
  bool hasFocus = false;
  bool obscureText;
  TextEditingController controller;
  FocusNode focusNode;

  void initState() {
    super.initState();
    obscureText = (widget.obscureText ?? false) || (widget.showPwd ?? false);
    controller = widget.controller ?? TextEditingController();
    controller.addListener(() {
      bool tempContentNotEmpty = controller.text.toString().length != 0;
      if (show != tempContentNotEmpty) {
        show = tempContentNotEmpty;
        notify();
      } else {
        show = tempContentNotEmpty;
      }
    });

    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(() {
      bool tempHasFocus = focusNode.hasFocus;
      if (hasFocus != tempHasFocus) {
        hasFocus = tempHasFocus;
        notify();
      } else {
        hasFocus = tempHasFocus;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextField textField = TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: widget.decoration,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization,
      style: widget.style,
      strutStyle: widget.strutStyle,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      textDirection: widget.textDirection,
      readOnly: widget.readOnly,
      toolbarOptions: widget.toolbarOptions,
      showCursor: widget.showCursor,
      autofocus: widget.autofocus,
      obscuringCharacter: widget.obscuringCharacter,
      obscureText: obscureText,
      autocorrect: widget.autocorrect,
      smartDashesType: widget.smartDashesType,
      smartQuotesType: widget.smartQuotesType,
      enableSuggestions: widget.enableSuggestions,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      expands: widget.expands,
      maxLength: widget.maxLength,
      maxLengthEnforced: widget.maxLengthEnforced,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      cursorWidth: widget.cursorWidth,
      cursorRadius: widget.cursorRadius,
      cursorColor: widget.cursorColor,
      selectionHeightStyle: widget.selectionHeightStyle,
      selectionWidthStyle: widget.selectionWidthStyle,
      keyboardAppearance: widget.keyboardAppearance,
      scrollPadding: widget.scrollPadding,
      dragStartBehavior: widget.dragStartBehavior,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      onTap: widget.onTap,
      mouseCursor: widget.mouseCursor,
      buildCounter: widget.buildCounter,
      scrollController: widget.scrollController,
      scrollPhysics: widget.scrollPhysics,
      autofillHints: widget.autofillHints,
    );
    List<Widget> children = [];
    children.add(Flexible(child: textField));
    if (widget.showClear && show && hasFocus) {
      children.add(GestureDetector(
        onTap: onClear,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.cancel, size: 18, color: Colors.grey),
        ),
      ));
    }

    if (widget.showPwd && show && hasFocus) {
      children.add(GestureDetector(
        onTap: onChangePwd,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(textField.obscureText ? VooIcon.view : VooIcon.close_eye, size: 18, color: Colors.grey),
        ),
      ));
    }

    return Row(children: children);
  }

  void onClear() {
    controller.clear();
  }

  void onChangePwd() {
    obscureText = !obscureText;
    if (mounted) setState(() {});
  }

  void notify() {
    if (widget.showClear || widget.showPwd && show || hasFocus && mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    focusNode?.dispose();
    super.dispose();
  }
}
