import 'package:flutter/material.dart'
    show
        BuildContext,
        ButtonStyle,
        ElevatedButton,
        OutlinedButton,
        StatelessWidget,
        Widget;

import 'text.dart' show FluiText;

class FluiTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final bool isOutlinedButton;

  const FluiTextButton({
    super.key,
    this.isOutlinedButton = false,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final commonChild = FluiText(text: text);
    final commonStyle = const ButtonStyle(enableFeedback: true);

    return isOutlinedButton
        ? OutlinedButton(
            onPressed: onPressed,
            style: commonStyle,
            child: commonChild,
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: commonStyle,
            child: commonChild,
          );
  }
}
