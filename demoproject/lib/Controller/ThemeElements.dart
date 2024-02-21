import 'package:flutter/material.dart';

class Themeelements extends ChangeNotifier {

  String appname = 'Trendy Bazaar';

  Color? get appbarcolor {
    return Colors.deepPurple.withOpacity(0.7);
  }

  Color? get bgcolor {
    return Colors.amber[300];
  }

  SizedBox addheight(h1) {
    return SizedBox(height: h1);
  }

  SizedBox addwidth(w1) {
    return SizedBox(
      width: w1,
    );
  }
}
/*

child: ListView(
children: [
GestureDetector(
onTap: () {
widgetshortcut.navigation(ProfileScreen(), context);
},
child: Container(
height: 250,
color: themeshortcut.bgcolor,
child: Column(
children: [
SizedBox(height: 8),
CircleAvatar(
child: Image.asset(
'assets/images/profile_icon.png'),
maxRadius: 70,
),
SizedBox(height: 20),
Row(
children: [
SizedBox(width: 20),
widgetshortcut
    .text('Jaydip Shingala'),
],
),
SizedBox(height: 5),
Row(
children: [
SizedBox(width: 20),
widgetshortcut
    .text('jaydip12@gmail.com'),
],
),
],
),
),
),
SizedBox(height: 10),
ListTile(
onTap: () {
  widgetshortcut.navigation(ProfileScreen(), context);
},
title: widgetshortcut.text('Favourites'),
leading: Icon(
Icons.favorite_outline,
color: Colors.black,
size: 25,
),
),
ListTile(
onTap: () {
  widgetshortcut.navigation(ProfileScreen(), context);
},
title: widgetshortcut.text('Orders'),
leading: Icon(
Icons.shopping_cart,
color: Colors.black,
size: 25,
),
),
ListTile(
onTap: () {
widgetshortcut.navigation(FeedbackScreen(), context);
},
title: widgetshortcut.text('Feedback'),
leading: Icon(
Icons.feedback,
color: Colors.black,
size: 25,
),
),
ListTile(
onTap: () {
widgetshortcut.navigation(AboutusScreen(), context);
},
title: widgetshortcut.text('About Us'),
leading: Icon(
Icons.info_outline,
color: Colors.black,
size: 25,
),
),
ListTile(
onTap: () {
widgetshortcut.navigation(SettingScreen(), context);
},
title: widgetshortcut.text('Settings'),
leading: Icon(
Icons.settings,
color: Colors.black,
size: 25,
),
),
],
),*/
