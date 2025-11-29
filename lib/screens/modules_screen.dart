import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import '../content.dart';
import '../models/module.dart';
import 'module_detail_screen.dart';

class ModulesScreen extends StatelessWidget {
  const ModulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('JoojooCodo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // This is for the main axis of a column - vertical
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, ${user?.email ?? 'coder'}!',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Pick a Module: ',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            // Here are the module list
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: modules.length,
            //     itemBuilder: (context, index) {
            //       final Module module = modules[index];
            //       return Card(
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(16),
            //         ),
            //         margin: const EdgeInsets.only(bottom: 12),
            //         child: ListTile(
            //           title: Text(module.title),
            //           subtitle: Text(module.description),
            //           trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            //           onTap: () {
            //             // print('Tapped module ${module.id}');
            //             Navigator.of(context).push(
            //               MaterialPageRoute(
            //                 builder: (_) => ModuleDetailScreen(module: module),
            //               ),
            //             );
            //           },
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
