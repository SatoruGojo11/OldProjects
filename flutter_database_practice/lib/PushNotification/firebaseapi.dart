import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebasemessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebasemessaging.requestPermission();
    final fCMToken = await _firebasemessaging.getToken();
    print('Token = ${fCMToken}');
  }
}
