import 'package:flutter/material.dart';
import 'package:flutter_practice/Logics/shortcuts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ToastApp extends StatefulWidget {
  const ToastApp({super.key});

  @override
  State<ToastApp> createState() => _ToastAppState();
}

class _ToastAppState extends State<ToastApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WidgetsShortcuts>(
      builder: (BuildContext context, widgetshortcut, Widget? child) =>
          Scaffold(
        appBar: AppBar(
          title: widgetshortcut.text('Toast Practice App'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: 'Login Success...',
                backgroundColor: Colors.green,
                fontSize: 25,
                textColor: Colors.green.shade900,
                timeInSecForIosWeb: 5,
                gravity: ToastGravity.TOP_RIGHT,
                toastLength: Toast.LENGTH_LONG,
              );
            },
            child: widgetshortcut.text(
              'Login',
            ),
          ),
        ),
      ),
    );
  }
}
