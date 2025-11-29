import 'package:flutter/material.dart';

import '../models/module.dart';
import '../models/lesson.dart';

class LessonScreen extends StatelessWidget {
  final Module module;
  final Lesson lesson;

  const LessonScreen({
    super.key,
    required this.module,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Show module + lesson number in the title
        title: Text('${module.title} • Lesson ${lesson.order}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lesson.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  lesson.content,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.4,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Later: mark as completed in Firebase.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Nice work! Lesson completed 🐥'),
                    ),
                  );
                },
                child: const Text('I got this!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
