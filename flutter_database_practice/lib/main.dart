import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Practice.dart';
// import 'PushNotification/firebaseapi.dart';
// import 'database/SheredPreference.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseApi().initNotifications();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SharePrefPrac(),
      /*theme: ThemeData(
        scaffoldBackgroundColor: Colors.black87,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.amber,
        ),
      ),*/
    ),
  );
}

appbar(txt, bgcolor) {
  var apb = AppBar(
    centerTitle: true,
    title: Text(
      '$txt',
      style: TextStyle(
        fontSize: 20,
        color: bgcolor,
      ),
    ),
  );
  return apb;
}


/*
  Keys of Android Studio :-

  MD5: ED:78:D8:8F:EF:EE:21:B6:D0:21:C5:AB:13:A8:9B:B6
  SHA1: 8D:EA:4C:17:C5:C4:51:FD:1E:88:4E:03:CB:2F:11:BF:25:97:84:53
  SHA-256: DE:E7:0B:30:5A:BD:E7:55:0C:D1:DC:94:10:6B:06:07:33:7A:AA:2F:C6:8F:5C:14:0C:FA:67:88:41:00:7A:28
  */
