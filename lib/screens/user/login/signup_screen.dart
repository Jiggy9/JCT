import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jct/common/utils/show_snackbar.dart';
import 'package:jct/screens/user/login/signin_screen.dart';
import 'package:jct/widgets/custom_button.dart';
import 'package:jct/widgets/custom_textfield.dart';
import '../settings/verify_email.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';
  bool isPasswordType = true;
  bool isConfirmPasswordType = true;
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  Future<void> signUp() async {
    if (_key.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email.text, password: password.text)
            .then(
          (value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EmailVerification(),
              ),
            );
          },
        );
        errorMessage = '';
      } on FirebaseAuthException catch (error) {
        showSnackBar(
          context,
          error.message!,
        );
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      body: Padding(
        padding: EdgeInsets.only(
            left: screen.width * 0.075, right: screen.width * 0.075),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: screen.height * 0.05),
              // Email text form field
              CustomTextfield(
                hintText: 'E-Mail',
                obscureText: false,
                controller: email,
                validator: validateEmail,
              ),
              SizedBox(height: screen.height * 0.025),
              // Password text form field
              CustomTextfield(
                validator: validatePassword,
                controller: password,
                obscureText: isPasswordType,
                hintText: 'Password',
              ),
              SizedBox(height: screen.height * 0.025),
              // Confirm Password text form field
              CustomTextfield(
                validator: validateConfirmPassword,
                controller: confirmPassword,
                obscureText: isConfirmPasswordType,
                hintText: 'Confirm Password',
              ),
              SizedBox(height: screen.height * 0.025),
              // Error Message
              Text(
                errorMessage,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: screen.height * 0.025),
              CustomButton(
                text: 'Sign Up',
                onPressed: signUp,
                color: Colors.white,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Already a User",
                  style: TextStyle(color: Colors.white),
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
      color: Colors.white,
      onPressed: () {
        setState(() {
          isPassword
              ? (isPasswordType = !isPasswordType)
              : (isConfirmPasswordType = !isConfirmPasswordType);
        });
      },
      icon: isPassword
          ? (isPasswordType
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off))
          : (isConfirmPasswordType
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off)),
    );
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
    String pattern1 = r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9]).{6,}$';
    RegExp regex = RegExp(pattern1);
    if (!regex.hasMatch(formPassword)) {
      return 'Password must include:\n- at least 6 characters\n- lower case character\n- upper case character\n- numeric value';
    }
    return null;
  }

  String? validateConfirmPassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty) {
      return 'Password is required';
    } else if (password.text != confirmPassword.text) {
      return 'Password not match';
    }
    String pattern1 = r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9]).{6,}$';
    RegExp regex = RegExp(pattern1);
    if (!regex.hasMatch(formPassword)) {
      return 'Invalid Password Format';
    }
    return null;
  }
}
