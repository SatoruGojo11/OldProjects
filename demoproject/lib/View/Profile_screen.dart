import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helper/Database.dart';
import '../Controller/WidgetElements.dart';
import '../Controller/ThemeElements.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData md = MediaQuery.of(context);
    var h1 = md.size.height;
    var w1 = md.size.width;

    return Consumer3(
      builder: (BuildContext context,
              Themeelements themeshortcut,
              Widgetselements widgetshortcut,
              DatabaseLogics databaselogic,
              Widget? child) =>
          SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black.withOpacity(0.2),
            title: widgetshortcut.text(
              "Profile",
              size: h1 / 30,
              fw: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          backgroundColor: themeshortcut.bgcolor,
          body: Container(
            height: h1 / 1.2,
            width: w1 / 0.4,
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            margin: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  child: Image.asset('assets/images/profile_icon.png'),
                  maxRadius: 100.0,
                ),
                Divider(
                  color: Colors.black54,
                  height: h1 / 30,
                  thickness: h1 / 140,
                ),
                widgetshortcut.text('Name :- Jaydip', size: w1 / 15),
                SizedBox(height: 15),
                widgetshortcut.text(
                  'Email id :- jaydip@gmail.com',
                  size: w1 / 20,
                ),
                SizedBox(height: 15),
                widgetshortcut.text(
                  'Password :- ******',
                  size: w1 / 20,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: widgetshortcut.eb(
                    300.0,
                    50.0,
                    color: Colors.deepOrange,
                  ),
                  onPressed: () {},
                  child: widgetshortcut.text(
                    'Edit Profile',
                    size: 20.0,
                    fw: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
