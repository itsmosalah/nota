abstract class TextEditingState {}

class TextEditingInitial extends TextEditingState {}

class NoteContentLoadingSuccess extends TextEditingState {}

class NoteContentLoadingFailure extends TextEditingState {}

class UpdateNoteSuccess extends TextEditingState {}

class UpdateNoteFailure extends TextEditingState {}
