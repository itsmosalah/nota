import 'package:flutter/material.dart';
import 'package:nota/cubits/notes_data_cubit/cubit.dart';
import 'package:nota/models/label_model.dart';

class LabelFilterContainer extends StatelessWidget {
  const LabelFilterContainer({super.key, required this.label});

  final LabelModel label;

  @override
  Widget build(BuildContext context) {
    final NotesDataCubit cubit = NotesDataCubit.get(context);
    final bool isFiltering = cubit.isLabelFiltered(label);
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: isFiltering
            ? Border.all(
                color: Colors.green,
                width: 1,
              )
            : null,
        color: label.color,
      ),
      child: InkWell(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: Text(label.title)),
            isFiltering
                ? const Icon(
                    Icons.check,
                    color: Colors.green,
                    shadows: [Shadow(color: Colors.black, blurRadius: 5)],
                  )
                : const SizedBox(),
          ],
        ),
        onTap: () => isFiltering
            ? cubit.removeLabelFilter(label)
            : cubit.addLabelFilter(label),
        onLongPress: () => showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  child: const Text('Delete'),
                  onPressed: () {
                    NotesDataCubit.get(context).deleteLabel(label: label);
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: const Text('Modify'),
                  onPressed: () => print('change color label ${label.id}'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
