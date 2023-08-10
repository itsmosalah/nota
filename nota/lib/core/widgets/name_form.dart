import 'package:flutter/material.dart';

import 'action_text_button.dart';

// ignore: must_be_immutable
class NameForm extends StatelessWidget {
  final String title;
  final String submitActionText;
  final String cancelActionText;
  final Function submitCallback;
  final Function cancelCallback;
  final Function getErrorText;
  late TextEditingController textController;
  String? labelText;

  NameForm({
    super.key,
    required this.submitCallback,
    required this.cancelCallback,
    required this.title,
    required this.submitActionText,
    required this.cancelActionText,
    required this.getErrorText,
    String? defaultValue,
    this.labelText,
  }) {
    textController = TextEditingController(text: defaultValue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        ValueListenableBuilder(
          valueListenable: textController,
          builder: (context, value, child) => TextField(
            controller: textController,
            autofocus: true,
            decoration: InputDecoration(
              errorText: getErrorText(textController.value.text),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ActionTextButton(
              onPressed: () => cancelCallback(),
              text: cancelActionText,
            ),
            ActionTextButton(
              onPressed: () => submitCallback(textController.value.text),
              text: submitActionText,
            ),
          ],
        )
      ],
    );
  }
}
