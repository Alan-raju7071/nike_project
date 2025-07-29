import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SigninController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginWithEmail({
    required String email,
    required BuildContext context,
  }) async {
    try {
      const tempPassword = 'temp@123456'; // Must match registered password
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: tempPassword,
      );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login Successful!')),
        );
      }

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (_) => const SignupDetails(), // Navigate after login
      //   ),
      // );
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
