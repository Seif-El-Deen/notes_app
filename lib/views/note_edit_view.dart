import 'package:flutter/material.dart';
import 'package:notes_app/custom_widgets/custom_textfield.dart';

class NoteEditView extends StatelessWidget {
  const NoteEditView({Key? key}) : super(key: key);

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
              onPressed: () {},
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
            const CustomTextFormField(
              hintText: "Title",
              maxLines: 1,
            ),
            const SizedBox(height: 30),
            const CustomTextFormField(
              hintText: "Content",
              maxLines: 10,
            ),
          ],
        ),
      ),
    );
  }
}
