import 'package:flutter/material.dart';
import 'package:nike_project/Utilits/constants/colorConstants.dart';
import 'package:nike_project/view/nike_splash44/nike_splash44.dart';
import 'package:nike_project/widgets/linearindicator.dart';
import 'package:nike_project/widgets/whitebutton.dart';

class NikeSplash33 extends StatelessWidget {
  const NikeSplash33({super.key});

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
               child: Padding(
                 padding: const EdgeInsets.all(20),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    linearindicator(value: 0.75,),
                    Text("Want to use location \nServices to help you \nfind the closest Nike \nStore, access in-store \nand location-based \nfeatures, and see \nexperiences near you?",style: TextStyle(fontSize: 28,color: Colorconstants.white),),
                    Spacer(),
                     InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NikeSplash44(),));
                      },
                      child:  Center(child: whitebutton(text: "Next"))
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


