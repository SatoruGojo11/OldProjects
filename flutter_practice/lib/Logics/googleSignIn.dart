import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignin extends ChangeNotifier{

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late bool issignin;

  void signuser(){
    _googleSignIn.signIn();
    issignin == true;
    notifyListeners();
}
}