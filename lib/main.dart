import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nike_project/controller/cart_controller.dart';

import 'package:nike_project/view/homescreen/homescreen.dart';


import 'package:flutter/foundation.dart' show kIsWeb;



import 'package:provider/provider.dart';

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

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => CartProvider()),],
    child: MyApp())); 
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Homescreen()
    );
  }
}
