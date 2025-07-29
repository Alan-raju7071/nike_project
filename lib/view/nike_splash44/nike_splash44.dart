import 'package:flutter/material.dart';
import 'package:nike_project/Utilits/constants/colorConstants.dart';
import 'package:nike_project/view/nike_splash22/nike_splash22.dart';
import 'package:nike_project/widgets/linearindicator.dart';
import 'package:nike_project/widgets/whitebutton.dart';

class NikeSplash44 extends StatelessWidget {
  const NikeSplash44({super.key});

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
                  linearindicator(value: 1.0),
                  Spacer(),
                  
                  InkWell(
                    // onTap: () {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => NikeSplash22(),));
                    // },
                    child: whitebutton(text: "next"),
                    
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
