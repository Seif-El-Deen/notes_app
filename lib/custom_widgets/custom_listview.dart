import 'package:flutter/material.dart';
import 'package:notes_app/custom_widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  final List<Color> listColors = const [
    Color(0xff37bf7b),
    Color(0xffbfa237),
    Color(0xff3784bf),
    Color(0xff8037bf),
    Color(0xffbf5e37),
    Color(0xff60bf37),
    Color(0xffbabf37),
    Color(0xff37afbf),
    Color(0xff4b37bf),
    Color(0xffbf3752),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) =>
          NoteItem(color: listColors[index]),
    );
  }
}
