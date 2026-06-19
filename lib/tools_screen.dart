import 'package:flutter/material.dart';
import 'theme.dart';

class ToolsScreen extends StatefulWidget {
  const ToolsScreen({super.key});

  @override
  State<ToolsScreen> createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  final _distanceController = TextEditingController();
  String _selectedClub = "Driver";

  // Local list to track estimated club distances dynamically
  final List<Map<String, String>> _myBagDistances = [
    {"club": "Driver", "distance": "230 yards"},
    {"club": "7-Iron", "distance": "150 yards"},
    {"club": "Pitching Wedge", "distance": "110 yards"},
  ];

  void _addClubDistance() {
    if (_distanceController.text.isNotEmpty) {
      setState(() {
        _myBagDistances.add({
          "club": _selectedClub,
          "distance": "${_distanceController.text} yards",
        });
        _distanceController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Club yardage saved successfully!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CADDIE TOOLS",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: GolfTheme.primaryGreen,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Club Distance Estimator",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: GolfTheme.primaryGreen),
            ),
            const SizedBox(height: 8),
            Text(
              "Log your average striking yards to optimize club choice during play.",
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 20),

            // Club Selector & Input Row
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<String>(
                    value: _selectedClub,
                    decoration: InputDecoration(
                      labelText: "Club",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    items: [
                      "Driver",
                      "3-Wood",
                      "5-Iron",
                      "7-Iron",
                      "9-Iron",
                      "Sand Wedge",
                      "Putter"
                    ]
                        .map((club) =>
                            DropdownMenuItem(value: club, child: Text(club)))
                        .toList(),
                    onChanged: (value) =>
                        setState(() => _selectedClub = value!),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _distanceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Avg Yards",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Save Button
            ElevatedButton.icon(
              onPressed: _addClubDistance,
              style: ElevatedButton.styleFrom(
                backgroundColor: GolfTheme.primaryGreen,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text("Save to My Caddie Bag",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),

            const SizedBox(height: 28),
            const Text(
              "Your Caddie Bag Ranges",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: GolfTheme.primaryGreen),
            ),
            const SizedBox(height: 12),

            // Distances List Output Grid
            Expanded(
              child: ListView.builder(
                itemCount: _myBagDistances.length,
                itemBuilder: (context, index) {
                  final item = _myBagDistances[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: const Icon(Icons.shopping_bag,
                          color: GolfTheme.accentGold),
                      title: Text(item["club"]!,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Text(
                        item["distance"]!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: GolfTheme.primaryGreen),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
