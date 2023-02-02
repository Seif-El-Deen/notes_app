import 'package:flutter/material.dart';
import 'package:notes_app/cubits/notes_cubit/view_notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/view_notes_states.dart';
import 'package:notes_app/custom_widgets/custom_note_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewNotesCubit, ViewNotesStates>(
        builder: (context, state) {
      if (state is ViewNotesInitialState) {
        BlocProvider.of<ViewNotesCubit>(context).fetchAllNotes();
      }

      List<NoteModel> notes =
          BlocProvider.of<ViewNotesCubit>(context).notes ?? [];

      return ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) =>
            NoteItem(note: notes[index]),
      );
    });
  }
}
