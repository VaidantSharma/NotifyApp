import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notify_app/notification_Badge.dart';
import 'package:overlay_support/overlay_support.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  late final FirebaseMessaging _messaging;
  late int _totalNotification = 0;
  PushNotification? _notificationInfo;

  Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print(('Handling Background Notifications : ${message.messageId}'));
  }

  void registerNotification() async {
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print(('User Granted Permissions'));
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        PushNotification notification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
        );
        FirebaseMessaging.onBackgroundMessage(
            _firebaseMessagingBackgroundHandler);
        setState(() {
          _notificationInfo = notification;
          _totalNotification++;
        });
        if (_notificationInfo != null) {
          showSimpleNotification(
            Text(_notificationInfo!.title!),
            leading: NotificationBadge(totalNotification: _totalNotification),
            subtitle: Text(_notificationInfo!.body!),
            background: Colors.cyan.shade50,
            duration: const Duration(seconds: 5),
          );
        }
      });
    } else {
      print('User not granted Permission');
    }
  }

  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      PushNotification notification = PushNotification(
        title: initialMessage.notification?.title,
        body: initialMessage.notification?.body,
      );
      setState(() {
        _notificationInfo = notification;
        _totalNotification++;
      });
    }
  }

  @override
  void initState() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
      );
      checkForInitialMessage();
      setState(() {
        _notificationInfo = notification;
        _totalNotification++;
      });
    });
    //registerNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'App for capturing \nfirebase Push notification',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        NotificationBadge(totalNotification: _totalNotification),
        _notificationInfo != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'Title : ${_notificationInfo!.title}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Body : ${_notificationInfo!.body}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )
                ],
              )
            : Container(),
      ],
    );
  }
}

class PushNotification {
  String? title;
  String? body;

  PushNotification({this.title, this.body});
}
