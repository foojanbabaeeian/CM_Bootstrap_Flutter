import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'auth_gate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const CodeLingoApp());
}

class CodeLingoApp extends StatelessWidget {
  const CodeLingoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CodeLingo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.amber, brightness: Brightness.light),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFFFF8E1),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontFamily: 'Roboto', color: Colors.black87),
          )),
      home: const AuthGate(),
    );
  }
}
