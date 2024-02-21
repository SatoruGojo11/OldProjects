// import 'dart:convert';

// import 'package:demoproject/Controller/Apidata.dart';
import 'package:demoproject/Controller/WidgetElements.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;

class TryApp extends StatelessWidget {
  TryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Widgetselements>(
      builder: (context, widgetshortcut, child) => Scaffold(
        appBar: AppBar(
          title: Text('App bar'),
        ),
      ),
    );
  }
}

/*
body: Center(
            child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            thickness: 3,
          ),
          itemCount: 5,
          itemBuilder: (context, index) {
            try {
              return ListTile(
                title: Text('${ad.data.map((e) => Text(e))}'),
                subtitle: Text('Hello'),
              );
            } catch (e) {
              print(e);
              return CircularProgressIndicator();
            }
          },
        )),
 */
