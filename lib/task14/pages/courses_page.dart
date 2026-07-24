import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [

        ListTile(
          leading: Icon(Icons.book),
          title: Text("Flutter Development"),
        ),

        ListTile(
          leading: Icon(Icons.book),
          title: Text("Java Programming"),
        ),

        ListTile(
          leading: Icon(Icons.book),
          title: Text("Python Programming"),
        ),

        ListTile(
          leading: Icon(Icons.book),
          title: Text("Data Structures"),
        ),
      ],
    );
  }
}