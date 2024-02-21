import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool islogin = false;

class DatabaseLogics extends ChangeNotifier {
  final uinfo = [];

  sharedprefsetdata(email, pwd, {uname}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString('Email-id', email);
    pref.setString('Password', pwd);
    pref.setString('Username', uname);
    islogin = true;
    print(islogin);
    notifyListeners();
  }

  sharedprefgetdata() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    var email = pref.getString('Email-id') ?? '';
    var pwd = pref.getString('Password') ?? '';
    var uname = pref.getString('Username') ?? '';

    List<String> uinfo = ['$email', '$pwd', '$uname'];
    notifyListeners();
    return uinfo;
  }

// firebasesignin(eml, pwd) async {
//   await FirebaseAuth.instance
//       .signInWithEmailAndPassword(email: eml, password: pwd);
// }
}
