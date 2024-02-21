import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleInOut extends StatefulWidget {
  const GoogleInOut({super.key});

  @override
  State<GoogleInOut> createState() => _GoogleInOutState();
}

class _GoogleInOutState extends State<GoogleInOut> {
  bool isSignIn = false;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Google Sign In & Out',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: isSignIn
          ? Center(
        child: Column(
          children: [
            ClipRect(
              child: Image.network(
                _googleSignIn.currentUser!.photoUrl!,
                height: 50,
                width: 50,
              ),
            ),
            Spacer(flex: 10),
            Text(_googleSignIn.currentUser!.displayName!),
            Spacer(flex: 10),
            Text(_googleSignIn.currentUser!.email),
            Spacer(flex: 10),
            ElevatedButton(
              onPressed: _signout,
              child: Text(
                'Sign Out',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      )
          : Center(
        child: ElevatedButton(
          onPressed: _signin,
          child: Text(
            'Sign in',
          ),
        ),
      ),
    );
  }

  _signin() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        isSignIn = true;
      });
    } catch (e) {
      print(e);
    }
  }

  _signout() async {
    await _googleSignIn.signOut();
    setState(() {
      isSignIn = false;
    });
  }
}
