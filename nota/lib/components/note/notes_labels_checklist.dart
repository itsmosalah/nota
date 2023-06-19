import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/notes_data_cubit/cubit.dart';
import '../../cubits/notes_data_cubit/states.dart';
import '../../models/note_model.dart';
import '../label/label_container.dart';

class NotesLabelsList extends StatelessWidget {
  const NotesLabelsList({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    final NotesDataCubit cubit = NotesDataCubit.get(context);
    return SingleChildScrollView(
      child: Column(
        children: cubit.labelsList
            .map((label) => Row(
                  children: [
                    Expanded(child: LabelContainer(label: label)),
                    BlocBuilder<NotesDataCubit, NotesDataState>(
                      builder: (context, state) {
                        return Checkbox(
                            value: note.labels
                                .any((element) => label.id == element.id),
                            onChanged: (value) {
                              value!
                                  ? NotesDataCubit.get(context)
                                      .addLabelToNote(note: note, label: label)
                                  : NotesDataCubit.get(context)
                                      .removeLabelFromNote(
                                          note: note, label: label);
                            });
                      },
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }
}
