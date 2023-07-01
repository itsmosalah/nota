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

class LabelDeletionSuccess extends NotesDataState {}

class LabelDeletionFailure extends NotesDataState {}

class LabelAddedSuccess extends NotesDataState {}

class LabelAddedFailure extends NotesDataState {}

class LabelRemovalSuccess extends NotesDataState {}

class LabelRemovalFailure extends NotesDataState {}

class CreateLabelSuccessState extends NotesDataState {}

class CreateLabelFailureState extends NotesDataState {}

class LabelFilterSuccessState extends NotesDataState {}

class LabelFilterFailureState extends NotesDataState {}
