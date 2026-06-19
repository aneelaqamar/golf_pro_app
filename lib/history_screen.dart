import 'package:flutter/material.dart';
import 'theme.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample static list of past matches
    final List<Map<String, String>> pastRounds = [
      {
        "date": "June 15, 2026",
        "course": "Khyber Golf Club",
        "score": "76",
        "status": "+4"
      },
      {
        "date": "May 28, 2026",
        "course": "Margalla Greens Golf Club",
        "score": "82",
        "status": "+10"
      },
      {
        "date": "May 12, 2026",
        "course": "Peshawar Golf Club",
        "score": "79",
        "status": "+7"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Scorecard History",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: GolfTheme.primaryGreen,
        automaticallyImplyLeading:
            false, // Removes the back arrow since it's a main tab
      ),
      body: pastRounds.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history_toggle_off,
                      size: 64, color: Colors.grey.shade400),
                  const SizedBox(height: 16),
                  Text("No rounds recorded yet.",
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 16)),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: pastRounds.length,
              itemBuilder: (context, index) {
                final round = pastRounds[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: GolfTheme.primaryGreen.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.analytics,
                          color: GolfTheme.primaryGreen),
                    ),
                    title: Text(round["course"]!,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(round["date"]!),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          round["score"]!,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: GolfTheme.primaryGreen),
                        ),
                        Text(
                          round["status"]!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: round["status"]!.startsWith("-") ||
                                    round["status"] == "E"
                                ? Colors.green
                                : GolfTheme.accentGold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
