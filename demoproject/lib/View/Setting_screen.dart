import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helper/Database.dart';
import '../Controller/WidgetElements.dart';
import '../Controller/ThemeElements.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final items = [
    'Edit Profile',
    'Change Language',
    'Change Password',
    'Change Location',
    'Terms and Condition',
    'Privacy Policy',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer3(
      builder: (BuildContext context,
              Themeelements themeshortcut,
              Widgetselements widgetshortcut,
              DatabaseLogics databaselogic,
              Widget? child) =>
          Scaffold(
        backgroundColor: themeshortcut.bgcolor,
        appBar: AppBar(
          backgroundColor: themeshortcut.appbarcolor,
          title: Row(
            children: [
              Icon(Icons.settings),
              themeshortcut.addwidth(10.0),
              widgetshortcut.text('Settings'),
            ],
          ),
        ),
        body: ListView(
          children: [
            SizedBox(height: 10),
            for (int i = 0; i < items.length; i++)
              Padding(
                padding: EdgeInsets.all(8),
                child: ListTile(
                  onTap: () {},
                  tileColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(width: 2),
                  ),
                  splashColor: Colors.amber,
                  title: widgetshortcut.text('${items[i]}'),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
