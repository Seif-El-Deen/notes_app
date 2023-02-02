import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/custom_widgets/custom_textfield.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({Key? key}) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? title, subTitle;

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 30),
          CustomTextFormField(
            onSaved: (value) {
              title = value;
            },
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "Title is required";
              }
              return null;
            },
            hintText: "Title",
            maxLines: 1,
          ),
          const SizedBox(height: 30),
          CustomTextFormField(
            onSaved: (value) {
              subTitle = value;
            },
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "subTitle is required";
              }
              return null;
            },
            hintText: "Content",
            maxLines: 5,
          ),
          MaterialButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autoValidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            color: const Color(primaryColor),
            height: 60,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: const Text(
              "Add",
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}
