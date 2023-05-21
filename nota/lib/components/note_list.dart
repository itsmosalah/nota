import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/cubits/notes_data_cubit/cubit.dart';
import 'package:nota/cubits/notes_data_cubit/states.dart';
import 'note_tile.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = NotesDataCubit().get(context);
    return BlocConsumer<NotesDataCubit, NotesDataState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SizedBox.expand(
          child: DraggableScrollableSheet(
            initialChildSize: 1,
            builder: (context, scrollController) => ListView.builder(
              controller: scrollController,
              itemCount: cubit.notesList.length,
              itemBuilder: (BuildContext context, int index) =>
                  NoteTile(note: cubit.notesList[index], index: index),
            ),
          ),
        );
      },
    );
  }
}
