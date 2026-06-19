import 'package:flutter/material.dart';
import 'theme.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const InfoScreen(),
    const PracticeScreen(),
    const ToolsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GOLF PRO",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: Colors.white),
        ),
        backgroundColor: GolfTheme.primaryGreen,
        centerTitle: true,
        elevation: 4,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: GolfTheme.primaryGreen,
        selectedItemColor: GolfTheme.accentGold,
        unselectedItemColor: Colors.white70,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.collections), label: 'Gallery'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Info'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), label: 'Practice'),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Tools'),
        ],
      ),
    );
  }
}

// ==================== FEATURE 1: GALLERY/HOME (MULTIPLE IMAGES) ====================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Array matching your exact sidebar image assets!
    final courses = [
      {
        "img": "assets/golf_course.jpg",
        "title": "Championship Fairways",
        "sub": "Perfect your drive setup and alignment"
      },
      {
        "img": "assets/golf_course2.jpg",
        "title": "Pebble Beach Links",
        "sub": "Master coastal crosswinds and swing arcs"
      },
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text("Featured Courses",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: GolfTheme.primaryGreen)),
        const SizedBox(height: 12),

        // This loop dynamically builds a premium card for every image in your list
        ...courses.map((course) => Container(
              height: 200,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 4))
                ],
                image: DecorationImage(
                  image: AssetImage(course["img"]!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(course["title"]!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Text(course["sub"]!,
                          style: const TextStyle(
                              color: GolfTheme.accentGold, fontSize: 14)),
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}

// ==================== FEATURE 2: INFORMATION ====================
class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rules = [
      {
        "title": "The Proper Grip Setup",
        "desc":
            "Master overlapping, interlocking, and 10-finger club holding methods."
      },
      {
        "title": "Stance & Body Alignment",
        "desc":
            "Keep your feet parallel to target lines and shoulder-width apart."
      },
      {
        "title": "Putting Green Etiquette",
        "desc": "Basic country club rules regarding ball marker placements."
      }
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          height: 150,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              image: AssetImage('assets/golf_grip.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Text("Training Handbooks",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: GolfTheme.primaryGreen)),
        const SizedBox(height: 8),
        ...rules.map((rule) => Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 3,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: GolfTheme.accentGold,
                  child: Icon(Icons.menu_book, color: Colors.white),
                ),
                title: Text(rule["title"]!,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(rule["desc"]!),
                trailing: const Icon(Icons.arrow_forward_ios,
                    size: 16, color: GolfTheme.primaryGreen),
              ),
            )),
      ],
    );
  }
}

// ==================== FEATURE 3: PRACTICE (WITH PHOTOS) ====================
class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _buildPracticeCard(
            "assets/driving_range.jpg", "Driving Range", "3 Drills"),
        _buildPracticeCard(
            "assets/putting_green.jpg", "Putting Green", "5 Drills"),
      ],
    );
  }

  Widget _buildPracticeCard(String imagePath, String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.2),
              Colors.black.withOpacity(0.75)
            ],
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            const SizedBox(height: 2),
            Text(subtitle,
                style:
                    const TextStyle(color: GolfTheme.accentGold, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

// ==================== FEATURE 4: TOOLS ====================
class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Digital Toolkit",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: GolfTheme.primaryGreen)),
          const SizedBox(height: 16),
          ListTile(
            tileColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            leading: const Icon(Icons.calculate, color: GolfTheme.accentGold),
            title: const Text("Digital Scorecard Counter"),
            subtitle: const Text("Track Strokes, Putts & Penalties locally"),
            trailing:
                const Icon(Icons.add_circle, color: GolfTheme.primaryGreen),
            onTap: () {},
          ),
          const SizedBox(height: 12),
          ListTile(
            tileColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            leading: const Icon(Icons.straighten, color: GolfTheme.accentGold),
            title: const Text("Club Distance Estimator"),
            subtitle: const Text("Log your average club yardages"),
            trailing: const Icon(Icons.edit, color: GolfTheme.primaryGreen),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
