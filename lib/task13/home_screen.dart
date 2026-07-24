import 'package:flutter/material.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameController = TextEditingController();
  final rollController = TextEditingController();

  String course = "Flutter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Information"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Student Name",
              ),
            ),

            TextField(
              controller: rollController,
              decoration: const InputDecoration(
                labelText: "Roll Number",
              ),
            ),

            const SizedBox(height: 15),

            DropdownButton<String>(
              value: course,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                    value: "Flutter", child: Text("Flutter")),
                DropdownMenuItem(
                    value: "Java", child: Text("Java")),
                DropdownMenuItem(
                    value: "Python", child: Text("Python")),
                DropdownMenuItem(
                    value: "AI", child: Text("AI")),
              ],
              onChanged: (value) {
                setState(() {
                  course = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                final updatedCourse = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailsScreen(
                      name: nameController.text,
                      roll: rollController.text,
                      course: course,
                    ),
                  ),
                );

                if (updatedCourse != null) {
                  setState(() {
                    course = updatedCourse;
                  });
                }
              },
              child: const Text("View Details"),
            ),

            const SizedBox(height: 20),

            Text(
              "Current Course : $course",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}