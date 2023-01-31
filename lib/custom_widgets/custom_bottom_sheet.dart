import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/custom_widgets/custom_textfield.dart';

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
      child: ListView(
        children: [
          const SizedBox(height: 30),
          const CustomTextField(
            hintText: "Title",
            maxLines: 1,
          ),
          const SizedBox(height: 30),
          const CustomTextField(
            hintText: "Content",
            maxLines: 5,
          ),
          const SizedBox(height: 60),
          MaterialButton(
            onPressed: () {},
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
