import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/labels/label_filter.dart';
import 'package:nota/features/notes/view_model/states.dart';
import 'package:nota/core/models/label_model.dart';
import '../../../core/models/note_model.dart';

class NotesDataCubit extends Cubit<NotesDataState> {
  List<NoteModel> _notesList = [];
  List<LabelModel> _labelsList = [];
  late LabelsFilter _labelsFilter;

  NotesDataCubit() : super(NotesDataIsLoading()) {
    _loadNotesList();
    _loadLabelsList();
    _labelsFilter = LabelsFilter(cubit: this);
  }

  static NotesDataCubit get(BuildContext context) =>
      BlocProvider.of<NotesDataCubit>(context);

  List<NoteModel> get notesList => _notesList;

  List<LabelModel> get labelsList => _labelsList;

  LabelsFilter get labelsFilter => _labelsFilter;

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

  void deleteNote({required NoteModel note}) {
    note.delete().then((_) {
      _notesList.removeWhere((e) => e.id == note.id);
      emit(NotesDataDeletionSuccess());
    }).catchError((error) {
      print(error);
      emit(NotesDataDeletionFailure());
    });
  }

  void updateNoteTitle({required NoteModel note, required String newTitle}) {
    note.update(data: {"title": newTitle}).then((_) {
      emit(NotesDataUpdateSuccess());
    }).catchError((error) {
      emit(NotesDataUpdateFailure());
    });
  }

  NoteModel createNewNote() => createNote(
      title: "New Note",
      content: jsonEncode([
        {"insert": "\n"} // Empty note in Quill's format
      ]));

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

  void deleteLabel({required LabelModel label}) {
    label.delete().then((deletedLabel) {
      _labelsList.removeWhere((aLabel) => aLabel.id == label.id);

      removeDeletedLabelFromNote(note) =>
          note.labels.removeWhere((aLabel) => aLabel.id == label.id);

      _notesList.forEach(removeDeletedLabelFromNote);
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
      emit(CreateLabelSuccessState());
    }).catchError((error) {
      print(error);
      emit(CreateLabelFailureState());
    });
    return label;
  }

  // filtering

  bool isFilteringActive() => _labelsFilter.isFiltering;

  void addLabelFilter(LabelModel label) {
    _labelsFilter
        .addLabelFilter(label)
        .then((_) => emit(LabelFilterSuccessState()))
        .catchError((error) {
      emit(LabelFilterFailureState());
      print(error);
    });
  }

  void removeLabelFilter(LabelModel removedLabel) {
    _labelsFilter
        .removeLabelFilter(removedLabel)
        .then((_) => emit(LabelFilterSuccessState()))
        .catchError((error) {
      print(error);
      emit(LabelFilterFailureState());
    });
  }

  bool isLabelFiltered(LabelModel label) =>
      _labelsFilter.isLabelFiltered(label);
}
