import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nike_project/signup_details/signup_details.dart';
import 'package:nike_project/view/signup_screen/signup_screen.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

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
      home: SignupScreen()
    );
  }
}
