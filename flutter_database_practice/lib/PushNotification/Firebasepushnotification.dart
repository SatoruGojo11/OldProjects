import 'package:flutter/material.dart';

class FirebasePushNotificationApp extends StatefulWidget {
  const FirebasePushNotificationApp({super.key});

  @override
  State<FirebasePushNotificationApp> createState() =>
      _FirebasePushNotificationAppState();
}

class _FirebasePushNotificationAppState
    extends State<FirebasePushNotificationApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification Screen',
        ),
      ),
      body: Center(child: Text('Hello'),),
    );
  }
}
