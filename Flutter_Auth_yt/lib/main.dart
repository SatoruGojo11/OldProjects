import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_yt/pages/auth_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // initialize Hive
  await Hive.initFlutter();

  // create hive box
  // ignore: unused_local_variable
  var box = await Hive.openBox('taskBox');

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
    ),
  );
}
