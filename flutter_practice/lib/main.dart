import 'package:flutter/material.dart';
import 'package:flutter_practice/widgets/GoogleSignIn&Up.dart';
import 'package:flutter_practice/Logics/shortcuts.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => WidgetsShortcuts(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My First App',
        theme: ThemeData(
          primaryColor: Colors.green,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.amber,
            centerTitle: true,
            elevation: 5,
          ),
          fontFamily: 'Georgia',
        ),
        home: GooglesigninupApp(),
      ),
    ),
  );
}
