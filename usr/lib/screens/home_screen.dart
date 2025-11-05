import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("H.L.-Eduroom"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: [
          _buildDashboardCard(context, "Courses", Icons.book, "/courses"),
          _buildDashboardCard(context, "Mock Tests", Icons.assignment, "/tests"),
          _buildDashboardCard(context, "Live Classes", Icons.video_call, "/live"),
          _buildDashboardCard(context, "Chat", Icons.chat, "/chat"),
          _buildDashboardCard(context, "Profile", Icons.person, "/profile"),
          _buildDashboardCard(context, "Results", Icons.bar_chart, "/results"),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Courses",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Tests",
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/courses');
              break;
            case 2:
              Navigator.pushNamed(context, '/tests');
              break;
          }
        },
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context, String title, IconData icon, String route) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48.0, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}