import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [

        ListTile(
          leading: Icon(Icons.grade),
          title: Text("Mathematics"),
          trailing: Text("A"),
        ),

        ListTile(
          leading: Icon(Icons.grade),
          title: Text("Flutter"),
          trailing: Text("A+"),
        ),

        ListTile(
          leading: Icon(Icons.grade),
          title: Text("Python"),
          trailing: Text("B+"),
        ),

        ListTile(
          leading: Icon(Icons.grade),
          title: Text("Data Structures"),
          trailing: Text("A"),
        ),
      ],
    );
  }
}