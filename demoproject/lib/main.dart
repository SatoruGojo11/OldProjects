import 'package:demoproject/Controller/Apidata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'View/Category_screen.dart';
// import 'View/Main_screen.dart';
import 'helper/Database.dart';
import 'Controller/WidgetElements.dart';
import 'Controller/ThemeElements.dart';
import 'View/Home_screen.dart';
// import 'View/Splash_screen.dart';
// import 'Try.dart';

Future<void> main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Themeelements(),
        ),
        ChangeNotifierProvider(
          create: (context) => Widgetselements(),
        ),
        ChangeNotifierProvider(
          create: (context) => DatabaseLogics(),
        ),
        ChangeNotifierProvider(
          create: (context) => Apidata(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.deepOrange,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    ),
  );
}
