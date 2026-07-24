import 'package:flutter/material.dart';

class EditCourseScreen extends StatefulWidget {
  const EditCourseScreen({super.key});

  @override
  State<EditCourseScreen> createState() => _EditCourseScreenState();
}

class _EditCourseScreenState extends State<EditCourseScreen> {
  @override
  Widget build(BuildContext context) {

    String course =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Course"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            DropdownButton<String>(
              value: course,
              isExpanded: true,
              items: const [

                DropdownMenuItem(
                  value: "Flutter",
                  child: Text("Flutter"),
                ),

                DropdownMenuItem(
                  value: "Java",
                  child: Text("Java"),
                ),

                DropdownMenuItem(
                  value: "Python",
                  child: Text("Python"),
                ),

                DropdownMenuItem(
                  value: "AI",
                  child: Text("AI"),
                ),
              ],
              onChanged: (value) {
                course = value!;
                (context as Element).markNeedsBuild();
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, course);
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}