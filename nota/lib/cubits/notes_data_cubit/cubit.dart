import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/cubits/notes_data_cubit/states.dart';
import 'package:nota/services/local/sqflite/sqflite_db.dart';
import '../../models/note_model.dart';

class NotesDataCubit extends Cubit<NotesDataState> {
  List<NoteModel> _notesList = [];
  final _db = SQFLiteDB();
  NotesDataCubit() : super(NotesDataIsLoading()) {
    loadNotesFromDB();
  }

  List<NoteModel> get notesList {
    _db.getAllNotes().then((value) {
      _notesList = value;
      emit(NotesDataLoadingSuccess());
    }).catchError((error) {
      print(error);
      emit(NotesDataLoadingFailure());
    });
    return _notesList;
  }

  void loadNotesFromDB() => notesList;

  static get(BuildContext context) => BlocProvider.of<NotesDataCubit>(context);

  void deleteNote(NoteModel note) {
    _db.deleteNote(note.id).then((_) {
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
    final newNote = NoteModel(id: -1, title: title, content: content);

    _db.insertNote(note: newNote).then((createdNoteID) {
      newNote.id = createdNoteID;
      _notesList.add(newNote);
      emit(NotesDataSavingSuccess());
    }).catchError((error) {
      print(error);
      emit(NotesDataSavingFailure());
    });
    return newNote;
  }

  void updateNote({required int id, String? title, String? content}) {
    final targetNote = _notesList.where((element) => element.id == id).first;
    targetNote.title = title ?? targetNote.title;
    targetNote.content = content ?? targetNote.content;

    _db
        .updateNote(note: targetNote)
        .then((_) => emit(NotesDataUpdateSuccess()))
        .catchError((error) {
      print(error);
      emit(NotesDataUpdateFailure());
    });
  }
}
