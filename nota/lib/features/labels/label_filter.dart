import 'package:nota/core/models/label_model.dart';
import 'package:nota/core/models/note_model.dart';
import 'package:nota/features/notes/view_model/cubit.dart';

class LabelsFilter {
  final NotesDataCubit cubit;
  final List<LabelModel> _filteringLabels = [];
  List<LabelModel> _filteredLabels = [];
  List<NoteModel> _filteredNotes = [];

  List<NoteModel> get filteredNotes => _filteredNotes;
  List<LabelModel> get filteredLabels => _filteredLabels;

  LabelsFilter({required this.cubit});

  Future<void> addLabelFilter(LabelModel label) async {
    final labeledNotes = await label.getLabeledNotes();
    _filteredNotes = (isFiltering ? _filteredNotes : cubit.notesList)
        .toSet()
        .intersection(labeledNotes)
        .toList();
    _filteringLabels.add(label);
    _reFilterLabels();
  }

  Future<void> removeLabelFilter(LabelModel removedLabel) async {
    _filteringLabels.remove(removedLabel);
    final notes =
        await LabelModel.getLabeledNotesByLabels(labels: _filteringLabels);
    _filteredNotes = notes.toList();
    _reFilterLabels();
  }

  void _reFilterLabels() {
    Set<LabelModel> labelsOfFilteredNotes = {};
    for (var note in _filteredNotes) {
      labelsOfFilteredNotes.addAll(note.labels);
    }
    _filteredLabels =
        labelsOfFilteredNotes.union(_filteringLabels.toSet()).toList();
  }

  bool isLabelFiltered(LabelModel label) => _filteringLabels.contains(label);

  bool get isFiltering => _filteringLabels.isNotEmpty;
}
