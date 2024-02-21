import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helper/Database.dart';
import '../Controller/WidgetElements.dart';
import '../Controller/ThemeElements.dart';

class AboutusScreen extends StatelessWidget {
  const AboutusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3(
      builder: (BuildContext context,
          Themeelements themeshortcut,
          Widgetselements widgetshortcut,
          DatabaseLogics databaselogic,
          Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: themeshortcut.appbarcolor,
            title: Text('About Us'),
          ),
          body: ListView(
            children: [
              Container(
                height: 660,
                width: 300,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 100, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber[300],
                ),
                child: Column(
                  children: [
                    widgetshortcut.text('About Us'),
                    themeshortcut.addheight(10.0),
                    widgetshortcut.text(
                      '     Trendy Bazaar is an ecommerce app that makes it easy for you to find and buy the products you love. With our app, you can browse a wide variety of products from different retailers, all in one place. We offer a variety of features to make your shopping experience as easy and convenient as possible.',
                      tfftext: 18.0,
                    ),
                    themeshortcut.addheight(25.0),
                    widgetshortcut.text('Social Media',tfftext: 30.0),
                    themeshortcut.addheight(20.0),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            widgetshortcut.text('Email id :- '),
                            TextButton(
                              onPressed: () {},
                              child: widgetshortcut.text(
                                  'trendybazaar1212@gmail.com',
                                  tfftext: 15.0,color: Colors.deepPurpleAccent),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            widgetshortcut.text('LinkedIn :- '),
                            TextButton(
                              onPressed: () {},
                              child: widgetshortcut.text('@trendybazaar12',
                                  tfftext: 15.0,color: Colors.deepPurpleAccent),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            widgetshortcut.text('Twitter :-'),
                            TextButton(
                              onPressed: () {},
                              child: widgetshortcut.text('@trendybazaar12',
                                  tfftext: 15.0,color: Colors.deepPurpleAccent),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            widgetshortcut.text('Facebook :-'),
                            TextButton(
                              onPressed: () {},
                              child: widgetshortcut.text('@trendybazaar12',
                                  tfftext: 15.0,color: Colors.deepPurpleAccent),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            widgetshortcut.text('Instagram :-'),
                            TextButton(
                              onPressed: () {},
                              child: widgetshortcut.text('@trendybazaar12',
                                  tfftext: 15.0,color: Colors.deepPurpleAccent),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            widgetshortcut.text('Youtube :-'),
                            TextButton(
                              onPressed: () {},
                              child: widgetshortcut.text('@trendybazaar12',
                                  tfftext: 15.0,color: Colors.deepPurpleAccent),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
