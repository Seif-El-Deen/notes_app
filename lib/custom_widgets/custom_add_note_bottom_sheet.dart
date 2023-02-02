import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/custom_widgets/custom_add_note_form.dart';
import 'package:notes_app/custom_widgets/custom_textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        border: Border.all(
          width: 3,
          color: const Color(primaryColor),
        ),
      ),
      child: SingleChildScrollView(
        child: BlocConsumer<AddNoteCubit, AddNoteStates>(
          listener: (BuildContext context, Object? state) {
            if (state is AddNoteFailureState) {
              print("Failed ${state.errorMsg}");
            }
            if (state is AddNoteSuccessState) {
              Navigator.pop(context);
            }
          },
          builder: (BuildContext context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is AddNoteLoadingState ? true : false,
                child: AddNoteForm());
          },
        ),
      ),
    );
  }
}
