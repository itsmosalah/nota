import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/cubits/notes_data_cubit/states.dart';
import '../../models/note_model.dart';

class NotesDataCubit extends Cubit<NotesDataState> {
  NotesDataCubit() : super(NotesDataIsLoading());

  final notesList = NoteModel.createDummyList();

  static get(BuildContext context) => BlocProvider.of<NotesDataCubit>(context);

  void deleteNote(int index) {
    notesList.removeAt(index);
    emit(NotesDataDeletionSuccess());
  }

  void createNote({required NoteModel note}) {
    notesList.add(note);
    emit(NotesDataSavingSuccess());
  }
}
