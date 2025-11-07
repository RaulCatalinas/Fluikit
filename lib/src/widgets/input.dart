import 'package:flutter/material.dart'
    show
        BorderRadius,
        BorderSide,
        BuildContext,
        InputDecoration,
        MouseCursor,
        OutlineInputBorder,
        State,
        StatefulWidget,
        TextAlign,
        TextAlignVertical,
        TextEditingController,
        TextField,
        TextInputType,
        Widget;

class FluiInput extends StatefulWidget {
  final bool enabled;
  final bool readOnly;
  final String placeholder;
  final bool autofocus;
  final bool isMultiline;
  final String? initialValue;

  const FluiInput({
    super.key,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.isMultiline = false,
    this.initialValue,
    required this.placeholder,
  });

  @override
  State<StatefulWidget> createState() => FluiInputState();
}

class FluiInputState extends State<FluiInput> {
  final inputController = TextEditingController();
  late bool _enabled;

  @override
  void initState() {
    super.initState();
    _enabled = widget.enabled;
    inputController.text = widget.initialValue ?? '';
  }

  String getText() {
    return inputController.text;
  }

  void setText(String newText) {
    inputController.text = newText;
  }

  void toggleEnabled() {
    setState(() {
      _enabled = !_enabled;
    });
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: _enabled,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        hintText: widget.placeholder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(width: 1.0),
        ),
      ),
      autofocus: widget.autofocus,
      textAlign: TextAlign.center,
      keyboardType: widget.isMultiline ? TextInputType.multiline : null,
      maxLines: widget.isMultiline ? 3 : 1,
      mouseCursor: widget.readOnly || !_enabled ? MouseCursor.defer : null,
      textAlignVertical: TextAlignVertical.center,
      enableSuggestions: false,
      controller: inputController,
    );
  }
}
