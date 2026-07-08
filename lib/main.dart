import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String appBarTitle = "Flutter Profile";
  Color appBarColor = Colors.blue;
  String buttonText = "Follow";
  Color buttonColor = Colors.blue;
  IconData buttonIcon = Icons.person_outline;

  void followUser() {
  setState(() {
    if (buttonText == "Follow") {
      appBarTitle = "Following Profile";
      appBarColor = Colors.green;
      buttonText = "Following";
      buttonColor = Colors.green;
      buttonIcon = Icons.check;
    } else {
      appBarTitle = "Flutter Profile";
      appBarColor = Colors.blue;
      buttonText = "Follow";
      buttonColor = Colors.blue;
      buttonIcon = Icons.person_outline;
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: appBarColor,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue.shade100,
              child: const Icon(
                Icons.person,
                size: 70,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Ansh Gupta",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Flutter Developer",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "anshgupta@gmail.com",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: followUser,
              icon: Icon(buttonIcon),
              label: Text(buttonText),
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}