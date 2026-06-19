import 'package:flutter/material.dart';
import 'theme.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _quizCompleted = false;

  final List<Map<String, dynamic>> _questions = [
    {
      "question":
          "What color stakes mark a lateral water hazard on a golf course?",
      "options": ["White", "Red", "Yellow", "Blue"],
      "answer": 1 // Red
    },
    {
      "question":
          "What is the term for scoring 2 strokes under par on a single hole?",
      "options": ["Birdie", "Eagle", "Bogey", "Albatross"],
      "answer": 1 // Eagle
    },
    {
      "question":
          "When a ball is lost outside a hazard, how many minutes do rules allow to search for it?",
      "options": ["3 minutes", "5 minutes", "7 minutes", "Unlimited"],
      "answer": 0 // 3 minutes
    }
  ];

  void _answerQuestion(int selectedOptionIndex) {
    if (selectedOptionIndex == _questions[_currentQuestionIndex]["answer"]) {
      _score++;
    }

    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _quizCompleted = true;
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      _quizCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GOLF TRIVIA CHANNENGE",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: GolfTheme.primaryGreen,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: _quizCompleted
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.emoji_events,
                        size: 80, color: GolfTheme.accentGold),
                    const SizedBox(height: 16),
                    const Text("Quiz Finished!",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: GolfTheme.primaryGreen)),
                    const SizedBox(height: 8),
                    Text("Your Score: $_score / ${_questions.length}",
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: _resetQuiz,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: GolfTheme.primaryGreen),
                      child: const Text("Try Again",
                          style: TextStyle(color: Colors.white)),
                    )
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LinearProgressIndicator(
                    value: (_currentQuestionIndex + 1) / _questions.length,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        GolfTheme.accentGold),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "Question ${_currentQuestionIndex + 1} of ${_questions.length}",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _questions[_currentQuestionIndex]["question"],
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: GolfTheme.primaryGreen),
                  ),
                  const SizedBox(height: 40),
                  ...(_questions[_currentQuestionIndex]["options"]
                          as List<String>)
                      .asMap()
                      .entries
                      .map((entry) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: ElevatedButton(
                        onPressed: () => _answerQuestion(entry.key),
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                        child: Text(entry.value,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black87)),
                      ),
                    );
                  }).toList(),
                ],
              ),
      ),
    );
  }
}
