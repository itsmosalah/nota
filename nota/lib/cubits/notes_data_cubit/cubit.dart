import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/cubits/notes_data_cubit/states.dart';
import '../../models/note_model.dart';

class NotesDataCubit extends Cubit<NotesDataState> {
  List<NoteModel> _notesList = [];
  NotesDataCubit() : super(NotesDataIsLoading()) {
    _loadNotesList();
  }

  List<NoteModel> get notesList => _notesList;

  void _loadNotesList() {
    NoteModel.listAll.then((value) {
      _notesList = value;
      emit(NotesDataLoadingSuccess());
    }).catchError((error) {
      print(error);
      emit(NotesDataLoadingFailure());
    });
  }

  static get(BuildContext context) => BlocProvider.of<NotesDataCubit>(context);

  void deleteNote({required NoteModel note}) {
    note.delete().then((_) {
      _notesList.removeWhere((e) => e.id == note.id);
      emit(NotesDataDeletionSuccess());
    }).catchError((error) {
      print(error);
      emit(NotesDataDeletionFailure());
    });
  }

  NoteModel createNewNote() {
    return createNote(
        title: "New Note",
        content: jsonEncode([
          {"insert": "\n"}
        ]));
  }

  NoteModel createNote({required String title, required String content}) {
    final newNote = NoteModel(title: title, content: content);

    newNote.save().then((createdNote) {
      _notesList.add(createdNote);
      emit(NotesDataSavingSuccess());
    }).catchError((error) {
      print(error);
      emit(NotesDataSavingFailure());
    });
    return newNote;
  }

  void updateNote({required NoteModel note, String? title, String? content}) {
    Map<String, dynamic> data = {
      "id": note.id,
      "title": title ?? note.title,
      "content": content ?? note.content,
    };

    note
        .update(data: data)
        .then((_) => emit(NotesDataUpdateSuccess()))
        .catchError((error) {
      print(error);
      emit(NotesDataUpdateFailure());
    });
  }
}
