import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignupController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Registers user with email only and a temporary password.
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

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email registered successfully')),
      );
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

  /// Completes the profile by setting password and storing user details in Firestore.
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

      if (user != null) {
        // Update password
        await user.updatePassword(password);
        await user.reload();

        // Store user profile in Firestore
        await _firestore.collection("users").doc(user.uid).set({
          "email": user.email,
          "firstName": firstName,
          "surname": surname,
          "code": code,
          "dateOfBirth": dob,
          "createdAt": FieldValue.serverTimestamp(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Signup complete!")),
        );

        // Navigate to initial screen (home, dashboard, etc.)
        Navigator.of(context).popUntil((route) => route.isFirst);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No user found. Please log in again.")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }
}
