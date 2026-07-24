import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String name;
  final String roll;
  final String course;

  const DetailsScreen({
    super.key,
    required this.name,
    required this.roll,
    required this.course,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late String course;

  @override
  void initState() {
    super.initState();
    course = widget.course;
  }

  Widget detail(String title, String value) {
    return ListTile(
      title: Text(title),
      subtitle: Text(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Details"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            detail("Name", widget.name),
            detail("Roll Number", widget.roll),
            detail("Course", course),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.pushNamed(
                  context,
                  '/edit',
                  arguments: course,
                );

                if (result != null) {
                  setState(() {
                    course = result as String;
                  });
                }
              },
              child: const Text("Edit Course"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, course);
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}