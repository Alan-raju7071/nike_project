import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nike_project/signup_details/signup_details.dart';
import 'package:nike_project/signup_in/signup_in.dart';
import 'package:nike_project/signupsuccess/signupsuccess.dart';
import 'package:nike_project/splash_screen2/splash_screen2.dart';
import 'package:nike_project/view/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:nike_project/view/homescreen/homescreen.dart';
import 'package:nike_project/view/nike_splash11/nike_splash11.dart';
import 'package:nike_project/view/nike_splash22/nike_splash22.dart';
import 'package:nike_project/view/nike_splash44/nike_splash44.dart';
import 'package:nike_project/view/oderscreen/orderscreen.dart';
import 'package:nike_project/view/productdetails/productdetails.dart';
import 'package:nike_project/view/shopscreen/shopscreen.dart';
import 'package:nike_project/view/sign_inscreen/sign_inscreen.dart';
import 'package:nike_project/view/signup_screen/signup_screen.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nike_project/view/splashscreen1/splash_screen1.dart';

import 'firebase_options.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.web,
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp()); 
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Orderscreen()
    );
  }
}
