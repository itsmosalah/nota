abstract class NotesDataState {}

class NotesDataIsLoading extends NotesDataState {}

class NotesDataLoadingSuccess extends NotesDataState {}

class NotesDataLoadingFailure extends NotesDataState {}

class NotesDataSavingSuccess extends NotesDataState {}

class NotesDataSavingFailure extends NotesDataState {}

class NotesDataUpdateSuccess extends NotesDataState {}

class NotesDataUpdateFailure extends NotesDataState {}

class NotesDataDeletionSuccess extends NotesDataState {}

class NotesDataDeletionFailure extends NotesDataState {}
