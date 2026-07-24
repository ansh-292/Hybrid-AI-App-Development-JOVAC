import 'package:flutter/material.dart';

import 'drawer_menu.dart';

import 'pages/dashboard_page.dart';
import 'pages/attendance_page.dart';
import 'pages/assignments_page.dart';
import 'pages/profile_page.dart';

import 'pages/courses_page.dart';
import 'pages/notices_page.dart';
import 'pages/results_page.dart';

class PortalHome extends StatefulWidget {
  const PortalHome({super.key});

  @override
  State<PortalHome> createState() => _PortalHomeState();
}

class _PortalHomeState extends State<PortalHome>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  late TabController tabController;

  final List<Widget> bottomPages = const [
    DashboardPage(),
    AttendancePage(),
    AssignmentsPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),

      appBar: AppBar(
        title: const Text("College Student Portal"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,

        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.yellow,
          indicatorWeight: 4,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(
              icon: Icon(Icons.book),
              text: "Courses",
            ),
            Tab(
              icon: Icon(Icons.notifications),
              text: "Notices",
            ),
            Tab(
              icon: Icon(Icons.grade),
              text: "Results",
            ),
          ],
        ),
      ),

      body: Column(
        children: [

          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                CoursesPage(),
                NoticesPage(),
                ResultsPage(),
              ],
            ),
          ),

          const Divider(height: 1),

          SizedBox(
            height: 250,
            child: bottomPages[currentIndex],
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: "Attendance",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Assignments",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}