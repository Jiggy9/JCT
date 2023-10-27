import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:jct/screens/user/important_screen.dart';
import 'package:jct/screens/user/signin_screen.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   late Size mediaSize;
//   bool isPasswordType = true;
//   final _emailTextController1 = TextEditingController();
//   final _passwordTextController1 = TextEditingController();

//   void fun1() async {
//     try {
//       await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//               email: _emailTextController1.text,
//               password: _passwordTextController1.text)
//           .then((value) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const ImportantScreen(),
//           ),
//         );
//       });
//     } on FirebaseAuthException catch (error) {
//       if (error.code == 'email-already-in-use') {
//         ScaffoldMessenger.of(context).clearSnackBars();
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Email already in use.'),
//           ),
//         );
//       }
//       ScaffoldMessenger.of(context).clearSnackBars();
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Authentication failed.'),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.center,
//                 colors: [
//                   Color.fromARGB(255, 97, 0, 158),
//                   Color.fromARGB(255, 0, 0, 0),
//                 ],
//               ),
//             ),
//             child: const Padding(
//               padding: EdgeInsets.fromLTRB(10, 150, 0, 0),
//               child: Text(
//                 "Create your Student Account",
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                   color: Color.fromARGB(255, 225, 181, 255),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
//             child: Container(
//               height: double.infinity,
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Color.fromARGB(255, 255, 255, 255),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(50),
//                   topRight: Radius.circular(50),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       userTextField(
//                           "User Name", Icons.person, _emailTextController1),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       passwordTextField(
//                           "Password",
//                           Icons.lock,
//                           togglePassword(),
//                           isPasswordType,
//                           _passwordTextController1),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
//                             child: signInSignUpButton(context, false, fun1),
//                           ),
//                           homeButon(context),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 25,
//                         width: double.infinity,
//                         child: Padding(
//                           padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
//                           child: Text(
//                             'USER SIGN UP',
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget togglePassword() {
//     return IconButton(
//         onPressed: () {
//           setState(() {
//             isPasswordType = !isPasswordType;
//           });
//         },
//         icon: isPasswordType
//             ? const Icon(Icons.visibility)
//             : const Icon(Icons.visibility_off));
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
              SizedBox(height: screen.height * 0.025),
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
                      builder: ((context) => const SignInScreen()),
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
}
