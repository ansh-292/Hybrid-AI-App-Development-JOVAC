import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [

          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
            ),

            accountName: const Text("Ansh Gupta"),

            accountEmail: const Text(
              "Roll No: 2415000254",
            ),

            currentAccountPicture: const CircleAvatar(
              child: Icon(
                Icons.person,
                size: 40,
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text("Dashboard"),
            onTap: () => Navigator.pop(context),
          ),

          ListTile(
            leading: const Icon(Icons.book),
            title: const Text("Courses"),
            onTap: () => Navigator.pop(context),
          ),

          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () => Navigator.pop(context),
          ),

          ListTile(
            leading: const Icon(Icons.check_circle),
            title: const Text("Attendance"),
            onTap: () => Navigator.pop(context),
          ),

          ListTile(
            leading: const Icon(Icons.assignment),
            title: const Text("Assignments"),
            onTap: () => Navigator.pop(context),
          ),

          ListTile(
            leading: const Icon(Icons.grade),
            title: const Text("Results"),
            onTap: () => Navigator.pop(context),
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}