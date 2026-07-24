import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

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
              Icon(Icons.check_circle, size: 50, color: Colors.green),
              SizedBox(height: 10),
              Text(
                "Attendance",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text("Attendance: 85%"),
            ],
          ),
        ),
      ),
    );
  }
}