import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _handicapController = TextEditingController(text: "12.4");
  final _courseController = TextEditingController(text: "Pine Valley GC");
  bool _isEditing = false;

  void _toggleSaveEdit() {
    setState(() {
      if (_isEditing) {
        // Save logic can be added here later (e.g., saving to local storage)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("Profile settings updated successfully!"),
              duration: Duration(seconds: 1)),
        );
      }
      _isEditing = !_isEditing;
    });
  }

  void _handleLogout() {
    // Clear navigation history and slide all the way back to the Login Gate portal
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MY PROFILE",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: GolfTheme.primaryGreen,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon:
                Icon(_isEditing ? Icons.save : Icons.edit, color: Colors.white),
            onPressed: _toggleSaveEdit,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            // User Avatar Placeholder Image Layer
            CircleAvatar(
              radius: 50,
              backgroundColor: GolfTheme.primaryGreen.withOpacity(0.1),
              child: const Icon(Icons.person,
                  size: 60, color: GolfTheme.primaryGreen),
            ),
            const SizedBox(height: 16),
            const Text(
              "Aneela Qamar",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: GolfTheme.primaryGreen),
            ),
            const Text(
              "Club Member since 2026",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 32),

            // Profile Input Fields
            TextField(
              controller: _handicapController,
              enabled: _isEditing,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Current Handicap Index",
                prefixIcon:
                    const Icon(Icons.analytics, color: GolfTheme.primaryGreen),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _courseController,
              enabled: _isEditing,
              decoration: InputDecoration(
                labelText: "Home Golf Course",
                prefixIcon:
                    const Icon(Icons.flag, color: GolfTheme.primaryGreen),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 40),

            // Danger Zone Logout Button Actions
            ElevatedButton.icon(
              onPressed: _handleLogout,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade600,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text("Log Out Account",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
