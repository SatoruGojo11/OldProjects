import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helper/Database.dart';
import '../Controller/WidgetElements.dart';
import '../Controller/ThemeElements.dart';

class FeedbackScreen extends StatelessWidget {
  FeedbackScreen({super.key});

  final _login = GlobalKey<FormState>();

  final _namectrl = TextEditingController();
  final _emailctrl = TextEditingController();
  final _rspctrl = TextEditingController();

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
          Widget? child) =>
          Scaffold(
            backgroundColor: themeshortcut.bgcolor,
            appBar: AppBar(
              backgroundColor: themeshortcut.appbarcolor,
              title: Text('Feedback'),
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    themeshortcut.addheight(10.0),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: _login,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                themeshortcut.addwidth(10.0),
                                widgetshortcut.text('Subject',
                                    size: h1 / 50, fw: FontWeight.bold),
                              ],
                            ),
                            themeshortcut.addheight(5.0),
                            widgetshortcut.txtfmfieldtheme(
                                _namectrl,
                                label: 'Enter your Name',
                                picon: Icons.account_circle),
                            themeshortcut.addheight(5.0),
                            Row(
                              children: [
                                themeshortcut.addwidth(10.0),
                                widgetshortcut.text('E-mail Address',
                                    size: h1 / 50, fw: FontWeight.bold),
                              ],
                            ),
                            themeshortcut.addheight(5.0),
                            widgetshortcut.txtfmfieldtheme(
                                _emailctrl,
                                label: 'Enter your Email-id',
                                picon: Icons.email),
                            themeshortcut.addheight(5.0),
                            Row(
                              children: [
                                themeshortcut.addwidth(10.0),
                                widgetshortcut.text('Password',
                                    size: h1 / 50, fw: FontWeight.bold),
                              ],
                            ),
                            themeshortcut.addheight(5.0),
                            widgetshortcut.txtfmfieldtheme(
                                _rspctrl,
                                label: 'Enter your Response',
                                picon: Icons.feedback),
                            themeshortcut.addheight(10.0),
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    style: widgetshortcut.eb(
                                      h1 * double.maxFinite,
                                      w1 / 55,
                                      elevation: 5.0,
                                      color: Colors.deepOrange,
                                    ),
                                    onPressed: (){},
                                    child: widgetshortcut.text('Submit'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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