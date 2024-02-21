import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../helper/Database.dart';
import '../Controller/ThemeElements.dart';
import 'Home_screen.dart';
import 'Welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      print(islogin);
      if (islogin == true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else if (islogin == false) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomeScreen()),
        );
      } else {
        return CircularProgressIndicator();
      }
    });
    return Consumer<Themeelements>(
      builder: (context, themeshortcut, child) => Scaffold(
        backgroundColor: themeshortcut.bgcolor,
        body: Center(
          child: Lottie.asset(
            "assets/lottie/splashscreenlottie.json",
          ),
        ),
      ),
    );
  }
}

/*

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
          () =>
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomeScreen(),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Themeelements>(
        builder: (BuildContext context, color, child)
    =>
        Scaffold(
          backgroundColor: color.bgcolor,
          body: Center(
            child: Lottie.asset(
              "assets/lottie/splashscreenlottie.json",
            ),
          ),
        )
    );
  }
}
*/
