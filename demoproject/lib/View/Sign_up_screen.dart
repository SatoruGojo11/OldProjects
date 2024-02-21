import 'package:demoproject/View/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../helper/Database.dart';
import '../Controller/WidgetElements.dart';
import '../Controller/ThemeElements.dart';
import 'Welcome_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final _login = GlobalKey<FormState>();

  final _namectrl = TextEditingController();
  final _emailctrl = TextEditingController();
  final _pwdctrl = TextEditingController();

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
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                themeshortcut.addheight(25.0),
                Lottie.asset(
                  'assets/lottie/singupscreenlottie.json',
                  height: h1 / 5,
                  width: w1 / 2,
                ),
                themeshortcut.addheight(10.0),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _login,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            themeshortcut.addwidth(10.0),
                            widgetshortcut.text('User name',
                                size: h1 / 50, fw: FontWeight.bold),
                          ],
                        ),
                        themeshortcut.addheight(5.0),
                        widgetshortcut.txtfmfieldtheme(_namectrl,
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
                        widgetshortcut.txtfmfieldtheme(_emailctrl,
                            label: 'Enter your Email-id', picon: Icons.email),
                        themeshortcut.addheight(5.0),
                        Row(
                          children: [
                            themeshortcut.addwidth(10.0),
                            widgetshortcut.text('Password',
                                size: h1 / 50, fw: FontWeight.bold),
                          ],
                        ),
                        themeshortcut.addheight(5.0),
                        widgetshortcut.txtfmfieldtheme(_pwdctrl,
                            label: 'Enter your password',
                            picon: Icons.lock,
                            sicon: Icons.visibility,
                            maxline: 1,
                            hide: true),
                        themeshortcut.addheight(5.0),
                        widgetshortcut.pwValidator(_pwdctrl, h1 / 18, w1 * 1),
                        themeshortcut.addheight(10.0),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WelcomeScreen(),
                                  ),
                                ),
                                child: widgetshortcut.text(
                                  'Already have an account?',
                                  color: Colors.deepOrange,
                                  fw: FontWeight.bold,
                                  size: h1 / 50,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  databaselogic.sharedprefsetdata(
                                    _emailctrl.text,
                                    _pwdctrl.text,
                                    uname: _namectrl.text,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(widgetshortcut.snk(
                                    'Sign up Successfully..',
                                    bclr: Colors.green,
                                  ));
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                },
                                style: widgetshortcut.eb(
                                  h1 * double.maxFinite,
                                  w1 / 55,
                                  elevation: 5.0,
                                  color: Colors.deepOrange,
                                ),
                                child: widgetshortcut.text('Sign up'),
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
