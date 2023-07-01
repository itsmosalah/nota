import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/note_editor/presentation/view_model/states.dart';
import '../../../../models/note_model.dart';

class TextEditingCubit extends Cubit<TextEditingState> {
  late NoteModel note;
  String? _noteContent;

  TextEditingCubit() : super(TextEditingInitial());


  static TextEditingCubit get(context, {required NoteModel note}) =>
      BlocProvider.of<TextEditingCubit>(context)..initialize(note);

  void initialize(NoteModel note) {
    this.note = note;
    loadNoteContent();
  }

  bool isNoteContentLoaded() => _noteContent != null;
  String get noteContent => _noteContent!;

  void loadNoteContent() {
    note.getContent().then((value) {
      _noteContent = value;
      emit(NoteContentLoadingSuccess());
    }).catchError((error) {
      print(error);
      emit(NoteContentLoadingSuccess());
    });
  }

  void updateNote({String? title, String? content}) {
    note
        .update(data: {
          "content": content,
        })
        .then((_) {})
        .catchError((error) {
          print(error);
          emit(UpdateNoteFailure());
        });
  }
}
