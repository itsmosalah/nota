import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/cubits/notes_data_cubit/states.dart';
import 'package:nota/models/label_model.dart';
import '../../models/note_model.dart';

class NotesDataCubit extends Cubit<NotesDataState> {
  List<NoteModel> _notesList = [];
  List<LabelModel> _labelsList = [];
  final List<LabelModel> _filteringLabels = [];
  List<LabelModel> _filteredLabels = [];
  List<NoteModel> _filteredNotes = [];

  NotesDataCubit() : super(NotesDataIsLoading()) {
    _loadNotesList();
    _loadLabelsList();
  }

  List<NoteModel> get notesList =>
      isFilteringActive() ? _filteredNotes : _notesList;

  List<LabelModel> get labelsList =>
      isFilteringActive() ? _filteredLabels : _labelsList;

  bool isFilteringActive() => _filteringLabels.isNotEmpty;

  void _loadNotesList() {
    NoteModel.listAll().then((list) {
      _notesList = list;
      emit(NotesDataLoadingSuccess());
    }).catchError((error) {
      print(error);
      emit(NotesDataLoadingFailure());
    });
  }

  void _loadLabelsList() {
    LabelModel.listAll().then((list) {
      _labelsList = list;
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

    note.update(data: data).then((_) {
      print(_.content);
      emit(NotesDataUpdateSuccess());
    }).catchError((error) {
      print(error);
      emit(NotesDataUpdateFailure());
    });
  }

  void deleteLabel({required LabelModel label}) {
    label.delete().then((value) {
      _labelsList.removeWhere((element) => element.id == value.id);
      emit(LabelDeletionSuccess());
    }).catchError((error) {
      print(error);
      emit(LabelDeletionFailure());
    });
  }

  void addLabelToNote({required NoteModel note, required LabelModel label}) {
    note.addLabel(label: label).then((_) {
      emit(LabelAddedSuccess());
    }).catchError((error) {
      print(error);
      emit(LabelAddedFailure());
    });
  }

  void removeLabelFromNote(
      {required NoteModel note, required LabelModel label}) {
    note.removeLabel(label: label).then((_) {
      note.labels.removeWhere(((element) => element.id == label.id));
      emit(LabelRemovalSuccess());
    }).catchError((error) {
      print(error);
      emit(LabelRemovalFailure());
    });
  }

  LabelModel createLabel({required String title, required Color color}) {
    final label = LabelModel(title: title, color: color);
    label.save().then((value) {
      labelsList.add(value);
      print(value.id);
      emit(CreateLabelSuccessState());
    }).catchError((error) {
      print(error);
      emit(CreateLabelFailureState());
    });
    return label;
  }

  // filtering
  void addLabelFilter(LabelModel label) {
    label.getLabeledNotes().then((notes) {
      _filteredNotes = notesList.toSet().intersection(notes).toList();
      _filteringLabels.add(label);
      Set<LabelModel> intersectingLabels = {};
      for (var note in notesList) {
        intersectingLabels.addAll(note.labels);
      }
      _filteredLabels =
          intersectingLabels.union(_filteringLabels.toSet()).toList();
      emit(LabelFilterSuccessState());
    }).catchError((error) {
      emit(LabelFilterFailureState());
      print(error);
    });
  }

  void removeLabelFilter(LabelModel removedLabel) {
    _filteringLabels.remove(removedLabel);
    LabelModel.getLabeledNotesByLabels(labels: _filteringLabels).then((notes) {
      _filteredNotes = notes.toList();
      emit(LabelFilterSuccessState());
    }).catchError((error) {
      print(error);
      emit(LabelFilterFailureState());
    });
  }

  bool isLabelFiltered(LabelModel label) => _filteringLabels.contains(label);
}
