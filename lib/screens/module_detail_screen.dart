import 'package:flutter/material.dart';

import '../models/module.dart';
import '../models/lesson.dart';
import '../content.dart';
import 'lesson_screen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ModuleDetailScreen extends StatelessWidget {
  final Module module;

  const ModuleDetailScreen({
    super.key,
    required this.module,
  });

  @override
  Widget build(BuildContext context) {
    // Get lessons for this module from our fake data
    final List<Lesson> lessons = lessonsByModule[module.id] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(module.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              module.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Lessons',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // List of lessons
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: lessons.length,
            //     itemBuilder: (context, index) {
            //       final lesson = lessons[index];
            //
            //       return Card(
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //         margin: const EdgeInsets.only(bottom: 10),
            //         child: ListTile(
            //           leading: CircleAvatar(
            //             child: Text('${lesson.order}'),
            //           ),
            //           title: Text(lesson.title),
            //           subtitle: Text(
            //             lesson.content,
            //             maxLines: 2,
            //             overflow: TextOverflow.ellipsis,
            //           ),
            //           onTap: () {
            //             // print('Tapped lesson: ${lesson.id}');
            //             Navigator.of(context).push(
            //               MaterialPageRoute(
            //                 builder: (_) => LessonScreen(
            //                   module: module,
            //                   lesson: lesson,
            //                 ),
            //               ),
            //             );
            //           },
            //         ),
            //       );
            //     },
            //   ),
            // ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('modules')
                    .doc(module.id)
                    .collection('lessons')
                    .orderBy('order')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Could not load lessons 🐤'),
                    );
                  }

                  final docs = snapshot.data?.docs ?? [];

                  if (docs.isEmpty) {
                    return const Center(
                      child: Text('No lessons yet.'),
                    );
                  }

                  final lessons = docs
                      .map((doc) => Lesson.fromDoc(doc))
                      .toList()
                    ..sort((a, b) => a.order.compareTo(b.order));

                  return ListView.builder(
                    itemCount: lessons.length,
                    itemBuilder: (context, index) {
                      final lesson = lessons[index];

                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text('${lesson.order}'),
                          ),
                          title: Text(lesson.title),
                          subtitle: Text(
                            lesson.content,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => LessonScreen(
                                  module: module,
                                  lesson: lesson,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
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
