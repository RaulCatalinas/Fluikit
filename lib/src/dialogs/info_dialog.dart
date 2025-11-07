import 'package:flutter/material.dart' show BuildContext, Navigator;

import '../widgets/text_button.dart' show FluiTextButton;
import 'base_dialog.dart' show BaseDialog;

class FluiInfoDialog extends BaseDialog {
  const FluiInfoDialog({
    super.key,
    required super.actions,
    required super.title,
    super.content,
  });

  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required String content,
    Function()? onPressed,
  }) {
    return BaseDialog.show<T>(
      context,
      title: title,
      content: content,
      actions: [
        FluiTextButton(
          text: 'Ok',
          onPressed: () {
            if (onPressed != null) onPressed();

            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
