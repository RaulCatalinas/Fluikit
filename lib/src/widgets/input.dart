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
        TextEditingController,
        TextField,
        Widget,
        TextAlignVertical;

class FluiReadOnlyInput extends StatefulWidget {
  final String placeholder;

  const FluiReadOnlyInput({super.key, required this.placeholder});

  @override
  State<StatefulWidget> createState() => FluiReadOnlyInputState();
}

class FluiReadOnlyInputState extends State<FluiReadOnlyInput> {
  final inputController = TextEditingController();

  String getText() {
    return inputController.text;
  }

  void setText(String newText) {
    inputController.text = newText;
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        hintText: widget.placeholder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(width: 1.0),
        ),
      ),
      textAlign: TextAlign.center,
      mouseCursor: MouseCursor.defer,
      textAlignVertical: TextAlignVertical.center,
      enableSuggestions: false,
      controller: inputController,
    );
  }
}
