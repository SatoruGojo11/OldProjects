import 'package:flutter/material.dart';
import 'package:flutter_practice/Logics/shortcuts.dart';
import 'package:provider/provider.dart';

class CardApp extends StatelessWidget {
  const CardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WidgetsShortcuts>(
      builder: (context, widsrtct, child) => Scaffold(
        appBar: AppBar(
          title: widsrtct.text(
            'Card Usage',
          ),
        ),
        body: Center(
          child: Card(
            elevation: 500,
            margin: EdgeInsets.all(20),
            shadowColor: Colors.red,
            color: Colors.brown,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('John Doe'),
                  subtitle: Text('john.doe@example.com'),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('123-456-7890'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
