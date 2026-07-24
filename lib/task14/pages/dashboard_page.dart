import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [

        Card(
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text("Student"),
            subtitle: Text("Ansh Gupta"),
          ),
        ),

        Card(
          child: ListTile(
            leading: Icon(Icons.school),
            title: Text("Course"),
            subtitle: Text("B.Tech CSE (AI & DS)"),
          ),
        ),

        Card(
          child: ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text("Today's Classes"),
            subtitle: Text("Flutter, Java, Data Structures"),
          ),
        ),
      ],
    );
  }
}