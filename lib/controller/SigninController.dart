import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nike_project/signup_details/signup_details.dart';
import 'package:nike_project/view/splashscreen1/splash_screen1.dart';


class SigninController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginWithEmail({
  required String email,
  required String password,
  required BuildContext context,
}) async {
  try {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Successful!')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SplashScreen1()),
      );
    }
  } on FirebaseAuthException catch (e) {
    String errorMsg;
    if (e.code == 'user-not-found') {
      errorMsg = 'No account found with this email.';
    } else if (e.code == 'wrong-password') {
      errorMsg = 'Incorrect password.';
    } else {
      errorMsg = 'Login failed: ${e.message}';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMsg)),
    );
  }
}


}
