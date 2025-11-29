import 'package:cloud_firestore/cloud_firestore.dart';

class Module {
  final String id;
  final String title;
  final String description;
  final int order;

  const Module({
    required this.id,
    required this.title,
    required this.description,
    required this.order,
  });

  factory Module.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Module(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      order: (data['order'] ?? 0) as int,
    );
  }
}
