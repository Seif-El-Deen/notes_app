import 'package:flutter/material.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:notes_app/custom_widgets/custom_button.dart';
import 'package:notes_app/custom_widgets/custom_colors_listview.dart';
import 'package:notes_app/custom_widgets/custom_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:intl/src/intl/date_format.dart';

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
          const SizedBox(height: 20),
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
          const SizedBox(height: 20),
          const ColorListView(),
          BlocBuilder<AddNoteCubit, AddNoteStates>(
            builder: (context, state) {
              return CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    var noteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: DateFormat("MMM d,yyyy")
                            .format(DateTime.now())
                            .toString(),
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                isLoading: state is AddNoteLoadingState ? true : false,
              );
            },
          )
        ],
      ),
    );
  }
}
