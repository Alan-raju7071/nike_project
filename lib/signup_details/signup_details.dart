import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nike_project/controller/SignupController.dart';
import 'package:nike_project/widgets/two_symbol.dart';

class SignupDetails extends StatefulWidget {
  final String email;
  const SignupDetails({super.key, required this.email});

  @override
  State<SignupDetails> createState() => _SignupDetailsState();
}

class _SignupDetailsState extends State<SignupDetails> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final SignupController _signupController = SignupController();

  bool _obscurePassword = true;
  int _resendTimer = 9;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  void _startResendTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_resendTimer > 0) {
        setState(() {
          _resendTimer--;
        });
        _startResendTimer();
      }
    });
  }

  @override
  void dispose() {
    _codeController.dispose();
    _firstNameController.dispose();
    _surnameController.dispose();
    _passwordController.dispose();
    _dayController.dispose();
    _monthController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  void _submitForm() async {
  if (_formKey.currentState!.validate()) {
    final dob =
        '${_dayController.text.padLeft(2, '0')}/${_monthController.text.padLeft(2, '0')}/${_yearController.text}';

    await _signupController.updatePasswordAndCompleteProfile(
      password: _passwordController.text.trim(),
      code: _codeController.text.trim(),
      firstName: _firstNameController.text.trim(),
      surname: _surnameController.text.trim(),
      dob: dob,
      context: context,
    );
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 89),
              const two_symbol(),
              const SizedBox(height: 40),
              const Text(
                "Now let’s make you a Nike \nMember.",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              const Text("We’ve sent a code to"),
              Text(widget.email,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),

              // Code field with refresh
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _codeController,
                      decoration: InputDecoration(
                        hintText: 'Code*',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter the code';
                        }
                        return null;
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: _resendTimer == 0 ? () => print('Resend') : null,
                    icon: const Icon(Icons.refresh),
                  ),
                  Text(
                    _resendTimer > 0 ? 'Resend code in ${_resendTimer}s' : 'Resend',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // First name and surname
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _firstNameController,
                      decoration: const InputDecoration(
                        hintText: 'First Name*',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter first name' : null,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _surnameController,
                      decoration: const InputDecoration(
                        hintText: 'Surname*',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter surname' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Password field
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Password*',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter password';
                  } else if (value.length < 8) {
                    return 'Minimum 8 characters';
                  } else if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)')
                      .hasMatch(value)) {
                    return 'Use uppercase, lowercase, and number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text('x Minimum of 8 characters'),
              const Text('X Uppercase, lowercase letters and one number'),
              const SizedBox(height: 20),

              const Text('Date of Birth', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _dayController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Day*',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        final day = int.tryParse(value ?? '');
                        if (day == null || day < 1 || day > 31) {
                          return 'Invalid day';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _monthController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Month*',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        final month = int.tryParse(value ?? '');
                        if (month == null || month < 1 || month > 12) {
                          return 'Invalid month';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _yearController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Year*',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        final year = int.tryParse(value ?? '');
                        if (year == null || year < 1900 || year > DateTime.now().year) {
                          return 'Invalid year';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text("Get a Nike Member Reward on your birthday."),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: _submitForm,
                child: const Text("Continue"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
