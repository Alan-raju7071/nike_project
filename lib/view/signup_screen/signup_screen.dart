import 'package:flutter/material.dart';
import 'package:nike_project/Utilits/constants/colorConstants.dart';
import 'package:nike_project/Utilits/constants/text_constants.dart';
import 'package:nike_project/controller/SignupController.dart';
import 'package:nike_project/signup_details/signup_details.dart';

import 'package:nike_project/widgets/two_symbol.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final SignupController _signupController = SignupController();

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
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(text: 'By continuing, I agree to Nike’s '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(text: ' \nand '),
                    TextSpan(
                      text: 'Terms of Use.',
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
    await _signupController.registerWithEmailOnly(
      email: _emailController.text.trim(),
      context: context,
    );

    // Navigate after registration
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SignupDetails(email: _emailController.text.trim()),
      ),
    );
  }
},


                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colorconstants.primaryblue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Continue",
                        style: TextStyle(fontSize: 16, color: Colorconstants.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 44),
              Row(
                children: const [
                  Expanded(child: Divider(height: 1.03)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.5),
                    child: Text("or", style: TextStyle(fontSize: 14)),
                  ),
                  Expanded(child: Divider(height: 1.03)),
                ],
              ),
              const SizedBox(height: 57),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _socialIcon("assets/images/googlelogo.png"),
                  _socialIcon("assets/images/facebooklogo.png"),
                  _socialIcon("assets/images/applelogo.png"),
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
