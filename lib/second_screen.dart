import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool _emailValid = true;
  bool _passwordConfirmationValid = true;

  void _validateEmail(String email) {
    setState(() {
      _emailValid = EmailValidator.validate(email);
    });
  }

  void _validatePasswordConfirmation(String confirmation) {
    if (confirmation != passwordController.text) {
      setState(() {
        _passwordConfirmationValid = false;
      });
    } else {
      setState(() {
        _passwordConfirmationValid = true;
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    errorText: _emailValid ? null : 'Invalid email format',
                  ),
                  onChanged: _validateEmail,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    errorText: _passwordConfirmationValid
                        ? null
                        : 'Passwords do not match',
                  ),
                  obscureText: true,
                  onChanged: _validatePasswordConfirmation,
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (_emailValid && _passwordConfirmationValid) {
                        // Perform sign up operation
                        String email = emailController.text;
                        String password = passwordController.text;
                        String confirmPassword = confirmPasswordController.text;
                        print('Email: $email');
                        print('Password: $password');
                        print('Confirm Password: $confirmPassword');
                      }
                    },
                  ),
                  const SizedBox(width: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      'BACK',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
