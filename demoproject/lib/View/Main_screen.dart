import 'package:demoproject/View/Favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Controller/ThemeElements.dart';
import '../Controller/WidgetElements.dart';
import '../helper/Database.dart';
import 'Cart_screen.dart';
import 'Home_screen.dart';
import 'Profile_screen.dart';
import 'Search_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaquery = MediaQuery.of(context);
    var h1 = mediaquery.size.height;
    var w1 = mediaquery.size.width;

    return Consumer3(
      builder: (BuildContext context,
          Themeelements themeshortcut,
          Widgetselements widgetshortcut,
          DatabaseLogics databaselogic,
          Widget? child) {

        final ScreenList = [
          HomeScreen(),
          CartScreen(),
          SearchScreen(),
          FavoriteScreen(),
          ProfileScreen(),
        ];

        return SafeArea(
          child: Scaffold(
            backgroundColor: themeshortcut.bgcolor,
            drawer: widgetshortcut.drawerofmyapp(
              h1 / 3.5,
              w1 / 1.5,
              themeshortcut.bgcolor,
              context,
            ),
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: themeshortcut.bgcolor,
              title: Padding(
                padding: EdgeInsets.only(top: h1 / 25, bottom: h1 / 40),
                child: widgetshortcut.text(
                  themeshortcut.appname,
                  color: Colors.blue[800],
                  fw: FontWeight.bold,
                  size: h1 / 35,
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(top: h1 / 80),
                  child: CircleAvatar(
                    backgroundColor: themeshortcut.bgcolor,
                    minRadius: h1 / 60,
                    child: Image(
                      image: AssetImage('assets/images/profile_icon.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                themeshortcut.addwidth(w1 / 30),
              ],
            ),
            bottomNavigationBar: widgetshortcut.curvednavbar(context),
            body: ScreenList[widgetshortcut.currentindex],
          ),
        );
      },
    );
  }
}
