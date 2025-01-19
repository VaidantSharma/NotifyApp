import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notify_app/home_page.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'NotifyApp',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Notification App'),
            backgroundColor: Colors.lightBlueAccent,
          ),
          body: const HomePage(),
        ),
      ),
    );
  }
}
