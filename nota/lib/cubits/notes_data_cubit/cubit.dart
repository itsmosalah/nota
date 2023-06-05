import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/cubits/notes_data_cubit/states.dart';
import '../../models/note_model.dart';

class NotesDataCubit extends Cubit<NotesDataState> {
  NotesDataCubit() : super(NotesDataIsLoading());

  final List<NoteModel> notesList = [];

  static get(BuildContext context) => BlocProvider.of<NotesDataCubit>(context);

  void deleteNote(int index) {
    notesList.removeAt(index);
    emit(NotesDataDeletionSuccess());
  }

  NoteModel createNewNote() {
    return createNote(
        title: "New Note",
        content: jsonEncode([
          {"insert": "\n"}
        ]));
  }

  NoteModel createNote({required String title, required String content}) {
    final newNote =
        NoteModel(id: notesList.length, title: title, content: content);
    notesList.add(newNote);
    emit(NotesDataSavingSuccess());
    return newNote;
  }

  void updateNote({required int id, String? title, String? content}) {
    final targetNote = notesList.where((element) => element.id == id).first;
    targetNote.title = title ?? targetNote.title;
    targetNote.content = content ?? targetNote.content;
    emit(NotesDataUpdateSuccess());
  }
}
