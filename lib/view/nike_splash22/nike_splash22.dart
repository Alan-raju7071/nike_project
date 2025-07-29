import 'package:flutter/material.dart';
import 'package:nike_project/Utilits/constants/colorConstants.dart';
import 'package:nike_project/view/nike_splash33/nike_splash33.dart';
import 'package:nike_project/widgets/linearindicator.dart';
import 'package:nike_project/widgets/whitebutton.dart';

class NikeSplash22 extends StatelessWidget {
  const NikeSplash22({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/Group 784 (1).png"),
              ),
            ),
          ),
        
             SafeArea(
               child: Column(
                children: [
                  linearindicator(value: 0.5),
                  Spacer(),
                   InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NikeSplash33(),));
                    },
                    child: whitebutton(text: "Next")
                  ),
                  const SizedBox(height: 48),
                ],
                           ),
             ),
          
        ],
      ),
    );
  }
}
