import 'package:flutter/material.dart';

class WillPopScopeDialogue extends StatelessWidget {
  const WillPopScopeDialogue({
    super.key,
    required this.child,
    required this.header,
    required this.textPrompt,
    required this.yesActionText,
    required this.noActionText,
  });

  final Widget child;
  final String header;
  final String textPrompt;
  final String yesActionText;
  final String noActionText;

  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(header),
              content: Text(textPrompt),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(yesActionText),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(noActionText),
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(onWillPop: onWillPop, child: child);
  }
}
