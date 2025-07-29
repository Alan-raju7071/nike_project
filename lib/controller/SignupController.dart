import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignupController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerWithEmailOnly({
    required String email,
    required BuildContext context,
  }) async {
    try {
      const tempPassword = 'temp@123456';
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: tempPassword,
      );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Signup Successful!')),
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMsg;
      if (e.code == 'email-already-in-use') {
        errorMsg = 'This email is already registered.';
      } else if (e.code == 'invalid-email') {
        errorMsg = 'Please enter a valid email address.';
      } else {
        errorMsg = 'Failed to register: ${e.message}';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMsg)),
      );
    }
  }

  Future<void> updatePasswordAndCompleteProfile({
    required String password,
    required String code,
    required String firstName,
    required String surname,
    required String dob,
    required BuildContext context,
  }) async {
    try {
      final user = _auth.currentUser;
      print("🔥 Current user: $user");

      if (user != null) {
        await user.updatePassword(password);
        await user.reload();

        print("✅ Password updated. Saving user data...");

        await _firestore.collection("users").doc(user.uid).set({
          "uid": user.uid,
          "email": user.email,
          "firstName": firstName,
          "surname": surname,
          "code": code,
          "dateOfBirth": dob,
          "password": password, // 🔐 Optional: don't store plaintext in production
          "createdAt": FieldValue.serverTimestamp(),
        });

        print("✅ User data written to Firestore.");

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Signup complete!")),
          );
        }

        Navigator.of(context).popUntil((route) => route.isFirst);
      } else {
        print("❌ No user found.");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No user found. Please log in again.")),
        );
      }
    } catch (e) {
      print("❌ Firestore error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }
}
