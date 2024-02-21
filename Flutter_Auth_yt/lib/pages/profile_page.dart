import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_yt/authentication/google_auth.dart';
import 'package:flutter_auth_yt/data/userdata.dart';

import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  final Userdata? userdata;

  ProfilePage({super.key, required this.userdata});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GoogleAuth _googleAuth = GoogleAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: text('Profile Page'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    '${FirebaseAuth.instance.currentUser?.photoURL.toString()}'),
                child: const Icon(
                  Icons.account_circle,
                  semanticLabel: 'Profile Photo',
                  color: Colors.black,
                  size: 125,
                ),
              ),
              // const SizedBox(height: 25),
              // text(
              //     'Name :- ${FirebaseAuth.instance.currentUser?.displayName.toString()}'),
              const SizedBox(height: 25),
              text(
                  'Email id :- ${FirebaseAuth.instance.currentUser?.email.toString()}'),
              // const SizedBox(height: 25),
              // text('Password :- ${widget.userdata?.userPwd}'),
              const SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  // sign out From Google
                  _googleAuth.signoutfromGoogle();
                  // open login page again
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(userdata: null),
                    ),
                  );
                },
                child: text('Log out', clr: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
