import 'package:flutter/material.dart';
import 'package:flutter_auth_yt/pages/login_page.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;

  MyButton({super.key, required this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 330,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            maximumSize: const Size(double.infinity, 50)),
        onPressed: onTap,
        child: text(
          buttonText,
          clr: Colors.white,
          fW: FontWeight.bold,
          fs: 20.0,
        ),
      ),
    );
  }
}
