import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/models/label_model.dart';
import 'package:nota/core/models/note_model.dart';
import 'package:nota/features/notes/views/widgets/note_container.dart';
import 'package:nota/features/notes/view_model/cubit.dart';
import 'package:nota/features/notes/view_model/states.dart';

import '../../labels/views/widgets/label_filter_container.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = NotesDataCubit.get(context);
    List<LabelModel> labelsList = [];
    List<NoteModel> notesList = [];

    void initializeLists() {
      labelsList = cubit.isFilteringActive()
          ? cubit.labelsFilter.filteredLabels
          : cubit.labelsList;
      notesList = cubit.isFilteringActive()
          ? cubit.labelsFilter.filteredNotes
          : cubit.notesList;
    }

    initializeLists();

    return BlocConsumer<NotesDataCubit, NotesDataState>(
      listener: (context, state) {
        initializeLists();
      },
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Labels:'),
          ),
          SizedBox(
            height: 70.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: labelsList.length,
              itemBuilder: (context, index) => LabelFilterContainer(
                label: labelsList[index],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Notes:'),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: notesList.length,
              itemBuilder: (context, index) => NoteContainer(
                note: notesList[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
