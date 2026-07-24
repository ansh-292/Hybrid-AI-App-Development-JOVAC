import 'package:flutter/material.dart';

class AssignmentsPage extends StatelessWidget {
  const AssignmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.assignment, size: 50, color: Colors.orange),
              SizedBox(height: 10),
              Text(
                "Assignments",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text("3 Assignments Pending"),
            ],
          ),
        ),
      ),
    );
  }
}