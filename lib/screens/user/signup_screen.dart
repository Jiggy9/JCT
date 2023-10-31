import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'verify_email.dart';
import 'package:jct/screens/user/signin_screen.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final GlobalKey<FormState> _key = GlobalKey<FormState>();
//   String errorMessage = '';
//   bool isPasswordType = true;
//   bool isConfirmPasswordType = true;
//   final email = TextEditingController();
//   final password = TextEditingController();
//   final confirmPassword = TextEditingController();

//   String? validateEmail(String? formEmail) {
//     if (formEmail == null || formEmail.isEmpty) {
//       return 'E- Mail Address is required';
//     }
//     String pattern = r'\w+@\w+\.\w+';
//     RegExp regex = RegExp(pattern);
//     if (!regex.hasMatch(formEmail)) {
//       return 'Invalid E-Mail Address Format';
//     }
//     return null;
//   }

//   String? validatePassword(String? formPassword) {
//     if (formPassword == null || formPassword.isEmpty) {
//       return 'Password is required';
//     }
//     String pattern1 = r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9]).{6,}$';
//     RegExp regex = RegExp(pattern1);
//     if (!regex.hasMatch(formPassword)) {
//       return 'Password must include:\n- at least 6 characters\n- lower case character\n- upper case character\n- numeric value';
//     }
//     return null;
//   }

//   String? validateConfirmPassword(String? formPassword) {
//     if (formPassword == null || formPassword.isEmpty) {
//       return 'Password is required';
//     } else if (password.text != confirmPassword.text) {
//       return 'Password not match';
//     }
//     String pattern1 = r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9]).{6,}$';
//     RegExp regex = RegExp(pattern1);
//     if (!regex.hasMatch(formPassword)) {
//       return 'Invalid Password Format';
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screen = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.only(
//             left: screen.width * 0.075, right: screen.width * 0.075),
//         child: Form(
//           key: _key,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Sign Up',
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: screen.height * 0.05),
//               TextFormField(
//                 validator: validateEmail,
//                 controller: email,
//                 decoration: const InputDecoration(
//                   hintText: 'E-Mail',
//                   filled: true,
//                 ),
//               ),
//               SizedBox(height: screen.height * 0.025),
//               TextFormField(
//                 validator: validatePassword,
//                 controller: password,
//                 obscureText: isPasswordType,
//                 decoration: InputDecoration(
//                   suffixIcon: togglePassword(true),
//                   hintText: 'Password',
//                   filled: true,
//                 ),
//               ),
//               SizedBox(height: screen.height * 0.025),
//               TextFormField(
//                 validator: validateConfirmPassword,
//                 controller: confirmPassword,
//                 obscureText: isConfirmPasswordType,
//                 decoration: InputDecoration(
//                   suffixIcon: togglePassword(false),
//                   hintText: 'Confirm Password',
//                   filled: true,
//                 ),
//               ),
//               SizedBox(height: screen.height * 0.025),
//               Text(
//                 errorMessage,
//                 style: const TextStyle(
//                   color: Colors.red,
//                 ),
//               ),
//               SizedBox(height: screen.height * 0.025),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     if (_key.currentState!.validate()) {
//                       try {
//                         await FirebaseAuth.instance
//                             .createUserWithEmailAndPassword(
//                                 email: email.text, password: password.text)
//                             .then((value) {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: ((context) => const ImportantScreen()),
//                             ),
//                           );
//                         });
//                         errorMessage = '';
//                       } on FirebaseAuthException catch (error) {
//                         errorMessage = error.message!;
//                       }
//                       setState(() {});
//                     }
//                   },
//                   child: const Text('Sign Up'),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: ((context) => const SignInScreen()),
//                     ),
//                   );
//                 },
//                 child: const Text('Already a User'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget togglePassword(bool isPassword) {
//     return IconButton(
//       onPressed: () {
//         setState(() {
//           isPassword
//               ? (isPasswordType = !isPasswordType)
//               : (isConfirmPasswordType = !isConfirmPasswordType);
//         });
//       },
//       icon: isPassword
//           ? (isPasswordType
//               ? const Icon(Icons.visibility)
//               : const Icon(Icons.visibility_off))
//           : (isConfirmPasswordType
//               ? const Icon(Icons.visibility)
//               : const Icon(Icons.visibility_off)),
//     );
//   }
// }

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
                'Sign Up',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screen.height * 0.05),
              // Email text form field
              TextFormField(
                validator: validateEmail,
                controller: email,
                decoration: const InputDecoration(
                  hintText: 'E-Mail',
                  filled: true,
                ),
              ),
              SizedBox(height: screen.height * 0.025),
              // Password text form field
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
              SizedBox(height: screen.height * 0.025),
              // Confirm Password text form field
              TextFormField(
                validator: validateConfirmPassword,
                controller: confirmPassword,
                obscureText: isConfirmPasswordType,
                decoration: InputDecoration(
                  suffixIcon: togglePassword(false),
                  hintText: 'Confirm Password',
                  filled: true,
                ),
              ),
              SizedBox(height: screen.height * 0.025),
              // Error Message
              Text(
                errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
              SizedBox(height: screen.height * 0.025),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
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
                        errorMessage = error.message!;
                      }
                      setState(() {});
                    }
                  },
                  child: const Text('Sign Up'),
                ),
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
                child: const Text('Already a User'),
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
