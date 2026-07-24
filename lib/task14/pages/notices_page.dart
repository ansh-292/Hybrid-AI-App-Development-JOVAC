import 'package:flutter/material.dart';

class NoticesPage extends StatelessWidget {
  const NoticesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [

        ListTile(
          leading: Icon(Icons.notifications),
          title: Text("Mid Semester Exam starts from 20 July"),
        ),

        ListTile(
          leading: Icon(Icons.notifications),
          title: Text("Assignment Submission on Friday"),
        ),

        ListTile(
          leading: Icon(Icons.notifications),
          title: Text("Hackathon Registration Open"),
        ),
      ],
    );
  }
}