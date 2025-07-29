import 'package:flutter/material.dart';
import 'package:nike_project/Utilits/constants/colorConstants.dart';
import 'package:nike_project/Utilits/constants/image_constants.dart';
import 'package:nike_project/Utilits/constants/text_constants.dart';
import 'package:nike_project/controller/SigninController.dart';
import 'package:nike_project/controller/SignupController.dart';
import 'package:nike_project/signup_details/signup_details.dart';

import 'package:nike_project/widgets/two_symbol.dart';

class Signinscreen extends StatefulWidget {
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  final _signinController = SigninController();


  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email';
    }

    return null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 89),
              const two_symbol(),
              const SizedBox(height: 40),
              Text(
                TextConstants.enteremail,
                style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    TextConstants.ind,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    TextConstants.chan,
                    style: const TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _emailController,
                validator: _validateEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email*',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.start,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    color: Colorconstants.black87,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(text: TextConstants.bycont),
                    TextSpan(
                      text: TextConstants.pri,
                      style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        color: Colorconstants.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(text: ' \nand '),
                    TextSpan(
                      text: TextConstants.ter,
                      style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  const Spacer(),
                  InkWell(
                 onTap: () async {
  if (_formKey.currentState!.validate()) {
     await _signinController.loginWithEmail(
      email: _emailController.text.trim(),
      context: context,
    );
  }
},



                    child: custombutton(),
                  ),
                ],
              ),
              const SizedBox(height: 44),
              Row(
                children: const [
                  Expanded(child: Divider(height: 1.03)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.5),
                    child: Text(TextConstants.or, style: TextStyle(fontSize: 14)),
                  ),
                  Expanded(child: Divider(height: 1.03)),
                ],
              ),
              const SizedBox(height: 57),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _socialIcon(ImageConstants.google),
                  _socialIcon(ImageConstants.faceb),
                  _socialIcon(ImageConstants.apple),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialIcon(String assetPath) {
    return Material(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 2,
      child: Container(
        width: 100,
        height: 36,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 38),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(assetPath),
            ),
          ),
        ),
      ),
    );
  }
}

class custombutton extends StatelessWidget {
  const custombutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colorconstants.primaryblue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        TextConstants.conti,
        style: TextStyle(fontSize: 16, color: Colorconstants.white),
      ),
    );
  }
}
