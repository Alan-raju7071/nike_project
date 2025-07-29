import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nike_project/Utilits/constants/colorConstants.dart';
import 'package:nike_project/Utilits/constants/image_constants.dart';

class SignupIn extends StatelessWidget {
  const SignupIn({super.key});

  Future<Map<String, dynamic>?> _getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc =
          await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (doc.exists) {
        return doc.data();
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconstants.primaryblue,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder<Map<String, dynamic>?>(
          future: _getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(color: Colors.white));
            }

            if (snapshot.hasError) {
              return const Center(child: Text("Error loading user data."));
            }

            if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: Text("No user data found."));
            }

            final userData = snapshot.data!;
            final firstName = userData['firstName'] ?? '';
            final surname = userData['surname'] ?? '';

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 217),
                    Container(
                      width: 70,
                      height: 24,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(ImageConstants.tick),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Hi $firstName $surname,\nWelcome to Nike.',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10,),
                    Text("Thanks for becoming a \nMember!",style: TextStyle(fontSize: 18,color: Colorconstants.greyash),),
                    SizedBox(height: 294,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Member Since 2025",style: TextStyle(fontSize: 14,color: Colorconstants.white),),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
