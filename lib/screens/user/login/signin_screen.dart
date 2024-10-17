import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jct/screens/user/usefull/important_screen.dart';

import 'package:jct/screens/user/login/signup_screen.dart';
import 'package:jct/theme/app_theme/app_theme.dart';
import 'forgot_password.dart';

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
    final aapTheme = context.theme.appColors;
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: context.theme.appColors.background,
      body: Padding(
        padding: EdgeInsets.only(
            left: screen.width * 0.075, right: screen.width * 0.075),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: context.theme.appColors.onBackground),
                ),
              ),
              SizedBox(height: screen.height * 0.05),
              TextFormField(
                validator: validateEmail,
                controller: email,
                autofocus: true,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  hintText: 'Enter Your E-Mail',
                  hintStyle: TextStyle(color: context.theme.appColors.surface),
                  labelText: 'E-Mail',
                  labelStyle: TextStyle(
                      color: context.theme.appColors.surface, fontSize: 18.0),
                  errorStyle: const TextStyle(fontSize: 18.0),
                  // focusColor: context.theme.appColors.onSurface,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: context.theme.appColors.onSurface,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  filled: true,
                  fillColor: context.theme.appColors.primary,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screen.height * 0.025),
              TextFormField(
                validator: validatePassword,
                controller: password,
                obscureText: isPasswordType,
                autofocus: true,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  suffixIcon: togglePassword(true),
                  suffixIconColor: context.theme.appColors.secondary,
                  hintText: 'Enter Your Password',
                  hintStyle: TextStyle(color: context.theme.appColors.surface),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: context.theme.appColors.surface, fontSize: 18),
                  errorStyle: const TextStyle(fontSize: 18.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: context.theme.appColors.onSurface,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  filled: true,
                  fillColor: context.theme.appColors.primary,
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: context.theme.appColors.surface),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(color: context.theme.appColors.secondary),
                  ),
                ),
              ),
              Text(
                errorMessage,
                style: TextStyle(
                  color: context.theme.appColors.error,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: context.theme.appColors.onBackground,
                      foregroundColor: context.theme.appColors.background),
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      try {
                        await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email.text, password: password.text)
                            .then(
                          (value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ImportantScreen(),
                              ),
                            );
                          },
                        );
                        errorMessage = '';
                      } on FirebaseAuthException catch (error) {
                        errorMessage = error.message!;
                        if (errorMessage ==
                            'An internal error has occurred. [ INVALID_LOGIN_CREDENTIALS ]') {
                          errorMessage = 'Invalid E-Mail or Password';
                        }
                      }
                      setState(() {});
                    }
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: Text(
                  "New User",
                  style: TextStyle(color: context.theme.appColors.onBackground),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget togglePassword(bool isPassword) {
    return IconButton(
        // color: context.theme.appColors.onSecondary,
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
