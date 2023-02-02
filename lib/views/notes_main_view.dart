import 'package:flutter/material.dart';
import 'package:notes_app/custom_widgets/custom_add_note_bottom_sheet.dart';
import 'package:notes_app/custom_widgets/custom_listview.dart';
import 'package:notes_app/custom_widgets/custom_note_item.dart';

class NotesMainView extends StatelessWidget {
  const NotesMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 24,
              ),
            ),
          ),
        ],
      ),
      body: const NotesListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: false,
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              builder: (context) => CustomBottomSheet());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
