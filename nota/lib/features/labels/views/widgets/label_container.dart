import 'package:flutter/material.dart';
import 'package:nota/core/widgets/action_text_button.dart';
import 'package:nota/features/notes/view_model/cubit.dart';
import 'package:nota/core/models/label_model.dart';

class LabelContainer extends StatelessWidget {
  const LabelContainer({super.key, required this.label});

  final LabelModel label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: label.color,
      ),
      child: InkWell(
        child: Center(child: Text(label.title)),
        onLongPress: () => showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ActionTextButton(
                  text: 'Delete',
                  onPressed: () {
                    NotesDataCubit.get(context).deleteLabel(label: label);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
