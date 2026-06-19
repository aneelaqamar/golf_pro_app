import 'package:flutter/material.dart';
import 'theme.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  // Drills list updated to use your exact local asset files!
  final List<Map<String, dynamic>> _drills = [
    {
      "title": "Gate Putting Drill",
      "subtitle": "Improves face angle at impact",
      "image": "assets/putting_green.jpg",
      "duration": "15 mins",
      "isCompleted": false,
    },
    {
      "title": "Alignment Stick Drive",
      "subtitle": "Ensures consistent club path alignment",
      "image": "assets/driving_range.jpg",
      "duration": "20 mins",
      "isCompleted": false,
    },
    {
      "title": "Perfect Overlap Grip Drill",
      "subtitle": "Builds ultimate club face control",
      "image": "assets/golf_grip.jpg",
      "duration": "10 mins",
      "isCompleted": false,
    },
  ];

  void _toggleDrillCompletion(int index) {
    setState(() {
      _drills[index]["isCompleted"] = !_drills[index]["isCompleted"];
    });

    final wasCompleted = _drills[index]["isCompleted"];
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(wasCompleted
            ? "Drill marked as completed! 🎉"
            : "Drill moved back to active status."),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int completedCount =
        _drills.where((drill) => drill["isCompleted"] == true).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("PRO TRAINING",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: GolfTheme.primaryGreen,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dynamic Progress Header Panel
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.grey.shade50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Today's Session Goal",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: GolfTheme.primaryGreen)),
                const SizedBox(height: 6),
                Text(
                  "Complete your active drills to lock in muscle memory.",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "Progress: $completedCount / ${_drills.length} Completed",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                        "${((completedCount / _drills.length) * 100).toInt()}%",
                        style: const TextStyle(
                            color: GolfTheme.accentGold,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: _drills.isEmpty ? 0 : completedCount / _drills.length,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                      GolfTheme.primaryGreen),
                  borderRadius: BorderRadius.circular(4),
                )
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
            child: Text("Active Practice Drills",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: GolfTheme.primaryGreen)),
          ),

          // Visual Card Grid List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _drills.length,
              itemBuilder: (context, index) {
                final drill = _drills[index];
                final isDone = drill["isCompleted"];

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  elevation: isDone ? 1 : 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image Header Layer for the Drill Card
                      Stack(
                        children: [
                          Opacity(
                            opacity: isDone
                                ? 0.5
                                : 1.0, // Dims the image slightly if completed
                            child: Image.asset(
                              drill["image"],
                              height: 130,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 130,
                                  color: Colors.grey.shade200,
                                  child: const Icon(Icons.image,
                                      size: 40, color: Colors.grey),
                                );
                              },
                            ),
                          ),
                          Positioned(
                            top: 12,
                            right: 12,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                drill["duration"],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Bottom Info Row with Checkbox Toggle
                      ListTile(
                        title: Text(
                          drill["title"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration:
                                isDone ? TextDecoration.lineThrough : null,
                            color: isDone ? Colors.grey : Colors.black87,
                          ),
                        ),
                        subtitle: Text(drill["subtitle"]),
                        trailing: Checkbox(
                          activeColor: GolfTheme.primaryGreen,
                          value: isDone,
                          onChanged: (bool? value) =>
                              _toggleDrillCompletion(index),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
