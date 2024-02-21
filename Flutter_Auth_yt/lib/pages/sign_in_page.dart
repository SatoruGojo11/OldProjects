import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_yt/components/my_textfield.dart';
import 'package:flutter_auth_yt/data/userdata.dart';

import '../components/my_button.dart';
import 'login_page.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  // text controller for both the Text Fields
  final usernamecontroller = TextEditingController();
  final useremailcontroller = TextEditingController();
  final userpwdcontroller = TextEditingController();
  final usersignup = GlobalKey<FormState>();

  final Userdata _userdata = Userdata();

  // create new user
  void createuser(ctx) async {
    try {
      // show loading circle
      showDialog(
        context: ctx,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: useremailcontroller.text,
        password: userpwdcontroller.text,
      );
      // pop the loading circle
      Navigator.pop(ctx);
      snkbar(
          ctx: ctx,
          message: 'Successfully Registered!!',
          snkbkcolor: Colors.green);
      //push into home page
      Navigator.pushReplacement(
        ctx,
        MaterialPageRoute(
          builder: (ctx) => LoginPage(
            userdata: _userdata,
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                // Logo
                const Icon(
                  Icons.lock,
                  color: Colors.black,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // Welcome Text
                text('!! Create a New Account !!'),

                const SizedBox(height: 25),

                Form(
                  key: usersignup,
                  child: Column(
                    children: [
                      // username TextField
                      MyTextField(
                        ctrl: usernamecontroller,
                        hintText: "Enter your Name",
                        obscureText: false,
                        textInputType: TextInputType.name,
                      ),
                      // useremail TextField
                      MyTextField(
                        ctrl: useremailcontroller,
                        hintText: "Enter your Email-id",
                        obscureText: false,
                        textInputType: TextInputType.emailAddress,
                      ),
                      // Password TextField
                      MyTextField(
                        ctrl: userpwdcontroller,
                        hintText: "Enter your Password",
                        obscureText: true,
                        textInputType: TextInputType.visiblePassword,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // signin button
                MyButton(
                  buttonText: "Sign up",
                  onTap: () {
                    if (usersignup.currentState!.validate()) {
                      _userdata.userName = usernamecontroller.text.toString();
                      _userdata.userEmail = useremailcontroller.text.toString();
                      _userdata.userPwd = userpwdcontroller.text.toString();
                      return createuser(context);
                    } else {
                      snkbar(
                        ctx: context,
                        message: 'Please Enter valid Details',
                        snkbkcolor: Colors.red,
                      );
                    }
                  },
                ),

                const SizedBox(height: 30),

                // not a member the Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text("Already Registered?",
                        fs: 16.0, clr: Colors.grey.shade800),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(userdata: null),
                        ),
                      ),
                      child: text(
                        "Sign in",
                        fs: 18.0,
                        clr: Colors.orange.shade900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
