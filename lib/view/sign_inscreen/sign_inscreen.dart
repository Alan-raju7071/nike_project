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
  final _passwordController = TextEditingController();

  

  

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 89),
                const two_symbol(),
                const SizedBox(height: 40),
                Text(
                  "Sign in with email",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                Text(
                  "Maecenas a quam a elit porta hendrerit \nid elementum massa.",
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(width: 10),
                const SizedBox(height: 20),
            
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(12),
              child: StatefulBuilder(
                builder: (context, setState) {
                  return TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (_) => setState(() {}),
                    validator: (value) {
            final emailPattern = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
            if (value == null || value.trim().isEmpty) {
              return 'Please enter your email';
            } else if (!emailPattern.hasMatch(value.trim())) {
              return 'Enter a valid email address';
            }
            return null;
                    },
                    decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 18),
            prefixIcon: const Icon(Icons.mail_outline, color: Colors.black87),
            suffixIcon: RegExp(r'^[^@]+@[^@]+\.[^@]+$')
                    .hasMatch(_emailController.text.trim())
                ? const Icon(Icons.check_circle, color: Colors.green)
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
             hintText: 'Email',
            isDense: true,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(12),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                  prefixIcon: const Icon(Icons.lock_outline, color: Colors.black87),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.red, width: 1.5),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.red, width: 1.5),
                  ),
                  hintText: 'Password',
                  isDense: true,
                ),
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
                   password: _passwordController.text.trim(),
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
                      child: Text("or continue", style: TextStyle(fontSize: 14)),
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
                SizedBox(height: 60,),
                Text("Nam id elementum risus. Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit. Integer luctus enim non \nsapien ullamcorper congue. "),
                SizedBox(height: 94,)
              ],

            ),
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
