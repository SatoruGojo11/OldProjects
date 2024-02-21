import 'package:flutter/material.dart';
import 'package:flutter_practice/Logics/shortcuts.dart';
import 'package:provider/provider.dart';

class SnackbarApp extends StatelessWidget {
  const SnackbarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WidgetsShortcuts>(
      builder: (context, widsrtct, child) => Scaffold(
        appBar: AppBar(
          title: widsrtct.text(
            'Snackbar App & Floating Action Button',
            clr: Colors.deepOrange,
            fs: 30.0,
          ),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(
                    seconds: 10,
                  ),
                  backgroundColor: Colors.deepOrange,
                  dismissDirection: DismissDirection.down,
                  padding: EdgeInsets.all(15),
                  content: widsrtct.text(
                    'You Tapped These button...',
                  ),
                  action: SnackBarAction(
                      label: 'Dismiss',
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      }),
                ),
              );
            },
            child: widsrtct.text(
              'Tap These Button',
              fs: 25.0,
            ),
          ),
        ),
      ),
    );
  }
}
