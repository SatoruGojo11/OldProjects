import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../helper/Database.dart';
import '../Controller/WidgetElements.dart';
import '../Controller/ThemeElements.dart';
import 'Home_screen.dart';
import 'Sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final login = GlobalKey<FormState>();

  final _emailctrl = TextEditingController();
  final _pwdctrl = TextEditingController();

  WelcomeScreen({super.key});

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
                themeshortcut.addheight(h1 / 25),
                Lottie.asset(
                  'assets/lottie/welcomescreenlottie.json',
                  height: h1 / 5,
                  width: w1 / 2,
                ),
                themeshortcut.addheight(h1 / 15),
                widgetshortcut.text(
                  'Welcome to Trendy bazaar',
                  fw: FontWeight.bold,
                  color: Colors.black87,
                  size: h1 / 25,
                ),
                themeshortcut.addheight(10.0),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: login,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        widgetshortcut.pwValidator(
                            _pwdctrl, h1 / 18, w1 * 1),
                        themeshortcut.addheight(10.0),
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  databaselogic.sharedprefsetdata(
                                    _emailctrl.text,
                                    _pwdctrl.text,
                                  );
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()),
                                  );
                                },
                                style: widgetshortcut.eb(
                                  h1 * double.maxFinite,
                                  w1 / 55,
                                  elevation: 5.0,
                                  color: Colors.deepOrange,
                                ),
                                child: widgetshortcut.text('Login'),
                              ),
                              themeshortcut.addheight(h1 * 0.01),
                              widgetshortcut.text('━━━━━━━━━━━ OR ━━━━━━━━━━━',
                                  color: Colors.black.withOpacity(0.3),
                                  size: h1 * 0.02),
                              themeshortcut.addheight(h1 * 0.02),
                              widgetshortcut.text(
                                "Don't have an account?",
                                color: Colors.deepOrange,
                                size: h1 * 0.02,
                                fw: FontWeight.bold,
                              ),
                              themeshortcut.addheight(h1 * 0.01),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignupScreen(),
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
