import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
              Icon(Icons.person, size: 50, color: Colors.deepPurple),
              SizedBox(height: 10),
              Text(
                "Profile",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text("Name: Ansh Gupta"),
              Text("Course: B.Tech CSE (AI & DS)"),
            ],
          ),
        ),
      ),
    );
  }
}