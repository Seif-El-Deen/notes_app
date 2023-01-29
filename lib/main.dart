import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/views/notes_main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "Poppins",
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const NotesMainView(),
    );
  }
}
