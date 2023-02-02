import 'package:flutter/material.dart';
import 'package:notes_app/cubits/notes_cubit/view_notes_cubit.dart';
import 'package:notes_app/custom_widgets/custom_colors_listview.dart';
import 'package:notes_app/custom_widgets/custom_textfield.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';

class NoteEditView extends StatefulWidget {
  const NoteEditView({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  State<NoteEditView> createState() => _NoteEditViewState();
}

class _NoteEditViewState extends State<NoteEditView> {
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Notes",
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.2)),
            child: IconButton(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = subTitle ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<ViewNotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.check,
                size: 24,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            CustomTextFormField(
              onChanged: (value) {
                title = value;
              },
              hintText: widget.note.title,
              maxLines: 1,
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              onChanged: (value) {
                subTitle = value;
              },
              hintText: widget.note.subTitle,
              maxLines: 10,
            ),
            const SizedBox(height: 20),
            EditNoteColorsList(note: widget.note),
          ],
        ),
      ),
    );
  }
}

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kListColors.indexOf(Color(widget.note.color));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GestureDetector(
            onTap: () {
              currentIndex = index;
              widget.note.color = kListColors[index].value;
              setState(() {});
            },
            child: ColorItem(
              isActive: currentIndex == index,
              color: kListColors[index],
            ),
          ),
        ),
      ),
    );
  }
}
