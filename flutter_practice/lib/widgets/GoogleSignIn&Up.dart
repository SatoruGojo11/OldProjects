import 'package:flutter/material.dart';
import 'package:flutter_practice/Logics/shortcuts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class GooglesigninupApp extends StatelessWidget {
  GooglesigninupApp({super.key});

  final namecontroller = TextEditingController();

  final _googleSignIn = GoogleSignIn();

  final issignin = false;

  // var _streamController = StreamController();

  @override
  Widget build(BuildContext context) {
    return Consumer<WidgetsShortcuts>(
      builder: (context, widsrtct, child) => Scaffold(
        appBar: AppBar(
          title: widsrtct.text(
            'Google Sign In & Sign Up',
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   width: 200,
              //   child: TextField(
              //     controller: namecontroller,
              //     decoration: widsrtct.dcrt(
              //       "Enter Your Name",
              //       "Name",
              //       prefix: const Icon(
              //         Icons.account_circle,
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: widsrtct.text('Sign in Using Google'),
              ),
              const SizedBox(height: 20),
              Card(
                color: Colors.grey,
                child: issignin
                    ? ListTile(
                        title: widsrtct.text(
                            _googleSignIn.currentUser!.displayName.toString()),
                        subtitle: widsrtct
                            .text(_googleSignIn.currentUser!.email.toString()),
                        leading: Image.network(
                            _googleSignIn.currentUser!.photoUrl.toString()),
                      )
                    : widsrtct.text('No data'),
              ),
              // StreamBuilder(
              //   stream: googledata,
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return CircularProgressIndicator();
              //     } else if (snapshot.connectionState ==
              //             ConnectionState.active ||
              //         snapshot.connectionState == ConnectionState.done) {
              //       if (snapshot.hasError) {
              //         return widsrtct.text('Error');
              //       } else if (snapshot.hasData) {
              //         return ListTile(
              //           title: widsrtct.text(snapshot.data.toString()),
              //         );
              //       } else {
              //         return widsrtct.text('Empty Data');
              //       }
              //     } else {
              //       return widsrtct.text(snapshot.connectionState);
              //     }
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
