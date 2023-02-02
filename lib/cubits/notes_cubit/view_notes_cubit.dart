import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/view_notes_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';

class ViewNotesCubit extends Cubit<ViewNotesStates> {
  ViewNotesCubit() : super(ViewNotesInitialState());
  List<NoteModel>? notes;
  fetchAllNotes() async {
    var notesBox = Hive.box<NoteModel>(kNotesBox);

    notes = notesBox.values.toList();
    print(notes!.length);

    emit(ViewNotesSuccessState());
  }
}
