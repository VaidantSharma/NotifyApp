import 'package:flutter/material.dart';
import 'package:notify_app/home_page.dart';

class NotificationBadge extends StatelessWidget {
  const NotificationBadge({super.key, required this.totalNotification});

  final int totalNotification;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '$totalNotification',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
