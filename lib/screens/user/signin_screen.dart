import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:jct/screens/user/signup_screen.dart';
import 'package:jct/screens/user/important_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String errorMessage = '';
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isPasswordType = true;
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: screen.width * 0.075, right: screen.width * 0.075),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screen.height * 0.05),
              TextFormField(
                validator: validateEmail,
                controller: email,
                decoration: const InputDecoration(
                  hintText: 'E-Mail',
                  filled: true,
                ),
              ),
              SizedBox(height: screen.height * 0.025),
              TextFormField(
                validator: validatePassword,
                controller: password,
                obscureText: isPasswordType,
                decoration: InputDecoration(
                  suffixIcon: togglePassword(true),
                  hintText: 'Password',
                  filled: true,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password'),
                ),
              ),
              Text(
                errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      try {
                        await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email.text, password: password.text)
                            .then((value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const ImportantScreen()),
                            ),
                          );
                        });
                        errorMessage = '';
                      } on FirebaseAuthException catch (error) {
                        errorMessage = error.message!;
                        if (errorMessage ==
                            'An internal error has occurred. [ INVALID_LOGIN_CREDENTIALS ]') {
                          errorMessage = 'Invalid E-Mail or Password';
                        }
                        print(errorMessage);
                      }
                      setState(() {});
                    }
                  },
                  child: const Text('Sign In'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const SignUpScreen()),
                    ),
                  );
                },
                child: const Text('New User'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget togglePassword(bool isPassword) {
    return IconButton(
        onPressed: () {
          setState(() {
            isPasswordType = !isPasswordType;
          });
        },
        icon: isPasswordType
            ? const Icon(Icons.visibility)
            : const Icon(Icons.visibility_off));
  }

  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty) {
      return 'E- Mail Address is required';
    }
    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formEmail)) {
      return 'Invalid E-Mail Address Format';
    }
    return null;
  }

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty) {
      return 'Password is required';
    }
    return null;
  }
}
