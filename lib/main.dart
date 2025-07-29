import 'package:flutter/material.dart';
import 'package:nike_project/view/loginscreen/login_screen.dart';
import 'package:nike_project/view/signup_screen/signup_screen.dart';
import 'package:nike_project/view/splashscreen/splash_screen.dart';


class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupScreen()

    );
  }
}
void main(){
  runApp(Myapp());
}