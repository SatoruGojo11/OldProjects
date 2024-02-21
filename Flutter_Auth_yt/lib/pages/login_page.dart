import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_yt/authentication/google_auth.dart';
import 'package:flutter_auth_yt/components/my_textfield.dart';
import 'package:flutter_auth_yt/data/userdata.dart';
import 'package:flutter_auth_yt/pages/sign_in_page.dart';
import '../components/my_button.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final Userdata? userdata;

  const LoginPage({super.key, required this.userdata});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // bool _checking = true;
  
  // text controller for both the Text Fields
  final useremailcontroller = TextEditingController();
  final userpwdcontroller = TextEditingController();
  final userlogin = GlobalKey<FormState>();

  // Sign in User method
  void signInUser() async {
    try {
      // show loading circle
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      // user sign in
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: useremailcontroller.text,
        password: userpwdcontroller.text,
      );
      // pop the loading circle
      Navigator.pop(context);
      snkbar(
          ctx: context,
          message: 'Successfully Logged In!!',
          snkbkcolor: Colors.green);
      //push into home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Homepage(userdata: widget.userdata),
        ),
      );
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        snkbar(
            ctx: context,
            message: 'No user found for that email.',
            snkbkcolor: Colors.red.shade400);
      } else if (e.code == 'wrong-password') {
        snkbar(
            ctx: context,
            message: 'Wrong password provided for that user.',
            snkbkcolor: Colors.red.shade400);
      } else {
        snkbar(
            ctx: context,
            message: 'Please Check Your Email id and Password',
            snkbkcolor: Colors.red.shade400);
      }
      //******** There is a one problem that when we enter wrong password than not display any message in snack bar
    }
  }

  // Reference from google Authpage
  GoogleAuth _googleAuth = GoogleAuth();

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
                const SizedBox(height: 20),
                // Logo
                const Icon(
                  Icons.lock,
                  color: Colors.black,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // Welcome Text
                text('!! Welcome !!'),

                const SizedBox(height: 25),

                Form(
                  key: userlogin,
                  child: Column(
                    children: [
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
                // Forgot Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      text(
                        'Forgot Password?',
                        clr: Colors.black,
                        fs: 18.0,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // signin button
                MyButton(
                  buttonText: "Sign in",
                  onTap: () {
                    if (userlogin.currentState!.validate()) {
                      return signInUser();
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

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13.0),
                        child: text(
                          'or Continue with',
                          clr: Colors.grey.shade800,
                          fs: 18.0,
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // google sign in button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // user Google sign in
                        _googleAuth.signInWithGoogle();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            13.0,
                          ),
                        ),
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset('asset/google.png'),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          13.0,
                        ),
                      ),
                      height: 100,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset('asset/facebook.png'),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // not a member the Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text("Don't have account?",
                        fs: 16.0, clr: Colors.grey.shade800),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInPage(),
                        ),
                      ),
                      child: text(
                        "Register now",
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

Text text(txt, {clr, fW, fs}) {
  return Text(
    "$txt",
    style: TextStyle(
      color: clr ?? Colors.black,
      fontWeight: fW ?? FontWeight.bold,
      fontSize: fs ?? 20,
    ),
  );
}

void snkbar({ctx, message, snkbkcolor}) {
  ScaffoldMessenger.of(ctx).showSnackBar(
    SnackBar(
      content: text(
        message,
        clr: Colors.black,
        fs: 13.0,
        fW: FontWeight.bold,
      ),
      action: SnackBarAction(
        label: 'close',
        onPressed: () {
          ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
        },
      ),
      elevation: 10,
      backgroundColor: snkbkcolor,
      padding: const EdgeInsets.all(5),
    ),
  );
}
