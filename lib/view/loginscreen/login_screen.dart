import 'package:flutter/material.dart';
import 'package:nike_project/Utilits/constants/colorConstants.dart';
import 'package:nike_project/Utilits/constants/image_constants.dart';
import 'package:nike_project/Utilits/constants/text_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   bool isSignUpSelected = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(ImageConstants.loginbackgru),
              ),
            ),
          ),

          // Dark Gradient Overlay
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colorconstants.black54,
                  Colorconstants.black87,
                ],
              ),
            ),
          ),

          // Foreground Content
          Positioned(
            bottom: 0,
            left: 0,
            
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Tick Logo
                  Container(
                    height: size.height * 0.021,
                    width: size.width * 0.133,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImageConstants.tick),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Info Text
                  const Text(
                    TextConstants.bringingNike,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colorconstants.white,
                    ),
                  ),
                  Text(TextConstants.inspot,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colorconstants.white,
                    ),),
                  const SizedBox(height: 30),

                  // Sign Up Button
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignUpSelected = true;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 12),
                          decoration: BoxDecoration(
                            color: isSignUpSelected ? Colorconstants.white : Colorconstants.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colorconstants.white),
                          ),
                          child: Text(
                            TextConstants.sigup,
                            style: TextStyle(
                              fontSize: 18,
                              color: isSignUpSelected ?  Colorconstants.primaryblue : Colorconstants.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignUpSelected = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 12),
                          decoration: BoxDecoration(
                            color: !isSignUpSelected ? Colorconstants.white : Colorconstants.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colorconstants.white),
                          ),
                          child: Text(
                            TextConstants.sigin,
                            style: TextStyle(
                              fontSize: 18,
                              color: !isSignUpSelected ? Colorconstants.primaryblue : Colorconstants.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 95),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
