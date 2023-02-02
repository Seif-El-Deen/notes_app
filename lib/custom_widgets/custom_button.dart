import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key, required this.onPressed, required this.isLoading})
      : super(key: key);
  final void Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: MaterialButton(
        onPressed: onPressed,
        color: const Color(primaryColor),
        height: 60,
        minWidth: 300,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: isLoading
            ? const CircularProgressIndicator()
            : const Text(
                "Add",
                style: TextStyle(fontSize: 30),
              ),
      ),
    );
    ;
  }
}
