import 'package:flutter/material.dart';
import 'package:nike_project/Utilits/constants/text_constants.dart';
import 'package:nike_project/splash_screen2/splash_screen2.dart';
import 'package:nike_project/view/signup_screen/signup_screen.dart';
import 'package:nike_project/widgets/two_symbol.dart';

class Signupsuccess extends StatelessWidget {
  const Signupsuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 89),
              const two_symbol(),
              const SizedBox(height: 40),
              Text(TextConstants.youhaved,style: TextStyle(fontSize: 24),),
              SizedBox(height: 61,),
              Row(
                children: [
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen2(),));
                    },
                    child: custombutton()),
                ],
              ),
            
          ],
        ),
      ),
    );
  }
}