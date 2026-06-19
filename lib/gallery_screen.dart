import 'package:flutter/material.dart';
import 'theme.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  String _searchQuery = "";
  String _selectedCategory = "All";

  final List<Map<String, String>> _allFeatures = [
    {
      "title": "Perfecting Your Grip",
      "category": "TRAINING",
      "image": "assets/golf_grip.jpg",
      "desc": "Master the interlocking and overlapping grip styles."
    },
    {
      "title": "Putting Green Basics",
      "category": "SHORT GAME",
      "image": "assets/putting_green.jpg",
      "desc": "Read the breaks, master tempo, and shave strokes."
    },
    {
      "title": "Driving Range Power",
      "category": "TRAINING",
      "image": "assets/driving_range.jpg",
      "desc": "Build a consistent, powerful swing rotation."
    },
    {
      "title": "Championship Course View",
      "category": "EXPLORE",
      "image": "assets/golf_course.jpg",
      "desc": "Navigate complex fairway hazards and bunkers."
    },
    {
      "title": "Signature 18th Hole",
      "category": "EXPLORE",
      "image": "assets/golf_course2.jpg",
      "desc": "Breathtaking look at pristine playing conditions."
    },
    {
      "title": "Escaping the Bunker",
      "category": "SHORT GAME",
      "image": "assets/bunker_shot.jpg",
      "desc": "Open up your wedge club-face slightly to exit sand."
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filter Logic
    final filteredFeatures = _allFeatures.where((item) {
      final matchesSearch =
          item["title"]!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              item["desc"]!.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory =
          _selectedCategory == "All" || item["category"] == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("GOLF ACADEMY",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: GolfTheme.primaryGreen,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          // Live Search Bar Widget
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) => setState(() => _searchQuery = value),
              decoration: InputDecoration(
                hintText: "Search training guides...",
                prefixIcon:
                    const Icon(Icons.search, color: GolfTheme.primaryGreen),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
          ),

          // Quick Category Filter Chips Bar
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: 8), // Fixed the padding configuration here!
            child: Row(
              children:
                  ["All", "TRAINING", "SHORT GAME", "EXPLORE"].map((category) {
                final isSelected = _selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    selectedColor: GolfTheme.accentGold.withOpacity(0.3),
                    checkmarkColor: GolfTheme.primaryGreen,
                    onSelected: (bool selected) {
                      setState(() => _selectedCategory = category);
                    },
                  ),
                );
              }).toList(),
            ),
          ),

          // Main Filtered Cards List View
          Expanded(
            child: filteredFeatures.isEmpty
                ? const Center(child: Text("No guides match your search."))
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: filteredFeatures.length,
                    itemBuilder: (context, index) {
                      final item = filteredFeatures[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  item["image"]!,
                                  height: 160,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (c, e, s) => Container(
                                      height: 160,
                                      color: Colors.grey.shade200,
                                      child: const Icon(Icons.image)),
                                ),
                                Positioned(
                                  top: 12,
                                  left: 12,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                        color: GolfTheme.accentGold,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Text(item["category"]!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            color: GolfTheme.primaryGreen)),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item["title"]!,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: GolfTheme.primaryGreen)),
                                  const SizedBox(height: 4),
                                  Text(item["desc"]!,
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade600)),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
