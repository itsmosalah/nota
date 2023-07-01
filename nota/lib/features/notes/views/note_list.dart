import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/views/widgets/note_container.dart';
import 'package:nota/features/notes/view_model/cubit.dart';
import 'package:nota/features/notes/view_model/states.dart';

import '../../labels/views/widgets/label_filter_container.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = NotesDataCubit.get(context);
    return BlocConsumer<NotesDataCubit, NotesDataState>(
      listener: (context, state) {
        // TODO: implement listener
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
              itemCount: cubit.labelsList.length,
              itemBuilder: (context, index) => LabelFilterContainer(
                label: cubit.labelsList[index],
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
              itemCount: cubit.notesList.length,
              itemBuilder: (context, index) => NoteContainer(
                note: cubit.notesList[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
