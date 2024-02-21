import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  Future<void> signInWithGoogle() async {
    try {
      // Google na page ne popup kare jema badha google na account dekhay
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        // Jyare User Teni koi pn 1 Id select karse tyar pachi data collect karse
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // create a new credential
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Once Signed In, return the UserCredential
        await FirebaseAuth.instance.signInWithCredential(credential);
      }
    } on FirebaseAuthException catch (e) {
      print("Error :- $e");
    }
  }

  Future<UserCredential?> signoutfromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
    } on FirebaseAuthException catch (e) {
      print("Error :- $e");
    }
    return null;
  }
}
