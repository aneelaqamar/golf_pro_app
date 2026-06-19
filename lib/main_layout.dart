import 'package:flutter/material.dart';
import 'gallery_screen.dart';
import 'quiz_screen.dart';
import 'tools_screen.dart';
import 'training_screen.dart';
import 'profile_screen.dart';
import 'theme.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  // Tracked screens list without invalid top-level const definitions
  final List<Widget> _screens = [
    const HomeDashboardView(),
    const GalleryScreen(),
    const ToolsScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: GolfTheme.primaryGreen,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_golf), label: "Academy"),
          BottomNavigationBarItem(
              icon: Icon(Icons.construction), label: "Tools"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// Dedicated Content Sub-Widget for the Main Home Feed view
class HomeDashboardView extends StatelessWidget {
  const HomeDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GOLF PRO",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: Colors.white),
        ),
        backgroundColor: GolfTheme.primaryGreen,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Header Status Card Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: GolfTheme.primaryGreen,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Welcome back, Player!",
                      style: TextStyle(color: Colors.white70, fontSize: 16)),
                  const SizedBox(height: 4),
                  const Text("Ready for a Perfect Round?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("LAST SCORE",
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 12)),
                            SizedBox(height: 4),
                            Text("+4 (76)",
                                style: TextStyle(
                                    color: GolfTheme.accentGold,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Column(
                          children: [
                            Text("HANDICAP",
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 12)),
                            SizedBox(height: 4),
                            Text("12.4",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 20, top: 24, bottom: 12),
              child: Text(
                "Quick Actions",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: GolfTheme.primaryGreen),
              ),
            ),

            // Feature Quick Action Rows - Fixed closing brackets completely!
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Tile 1: Golf Academy Screen shortcut
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GalleryScreen()),
                            );
                          },
                          child: Container(
                            height: 100,
                            margin: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 8)
                              ],
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.menu_book,
                                    color: GolfTheme.primaryGreen, size: 32),
                                SizedBox(height: 6),
                                Text("Golf Academy",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Tile 2: Trivia Rules Quiz Screen shortcut
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const QuizScreen()),
                            );
                          },
                          child: Container(
                            height: 100,
                            margin: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 8)
                              ],
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.quiz,
                                    color: GolfTheme.accentGold, size: 32),
                                SizedBox(height: 6),
                                Text("Rules Quiz",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Row 2: Full width Pro Training Tracker shortcut
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TrainingScreen()),
                      );
                    },
                    child: Container(
                      height: 75,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8)
                        ],
                      ),
                      child: const ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.amber,
                          child:
                              Icon(Icons.fitness_center, color: Colors.white),
                        ),
                        title: Text("Active Training Program",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14)),
                        subtitle:
                            Text("Track your daily drills & completion speed"),
                        trailing: Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 20, top: 24, bottom: 12),
              child: Text(
                "Featured Training Insight",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: GolfTheme.primaryGreen),
              ),
            ),

            // Premium visual section completely loading your golf_grip.jpg asset
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/golf_grip.jpg',
                      height: 170,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 170,
                          color: Colors.grey.shade200,
                          child: const Icon(Icons.image_not_supported,
                              size: 40, color: Colors.grey),
                        );
                      },
                    ),
                    const ListTile(
                      title: Text("Mastering Your Club Interlock Grip",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          "Securing a uniform connection ensures your clubface points square at impact for straighter shots."),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
