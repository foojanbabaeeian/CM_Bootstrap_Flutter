import 'package:cloud_firestore/cloud_firestore.dart';

class Lesson {
  final String id;
  final String title;
  final String content;
  final int order;

  const Lesson({
    required this.id,
    required this.title,
    required this.content,
    required this.order,
  });

  factory Lesson.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Lesson(
      id: doc.id,
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      order: (data['order'] ?? 0) as int,
    );
  }
}
