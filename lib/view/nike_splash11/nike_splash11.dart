import 'package:flutter/material.dart';
import 'package:nike_project/Utilits/constants/colorConstants.dart';
import 'package:nike_project/view/nike_splash22/nike_splash22.dart';
import 'package:nike_project/widgets/linearindicator.dart';
import 'package:nike_project/widgets/whitebutton.dart';


class NikeSplash11 extends StatelessWidget {
  const NikeSplash11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/splash11background.png"),
              ),
            ),
          ),

          // Foreground content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,//
                children: [
                  
                  linearindicator(value: 0.25),
                  
                  

                  
                  Text(
                    "To personalise your \nexperience and \nconnect you to sport.",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colorconstants.white,
                    ),
                  ),

                  const Spacer(), 

                  
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NikeSplash22()),
                        );
                      },
                      child: whitebutton(text:"Get Started" )
                    ),
                  ),

                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
