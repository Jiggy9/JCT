import 'package:flutter/material.dart';
import 'package:jct/screens/user/login/signin_screen.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(
        left: screen.width * 0.075,
        right: screen.width * 0.075,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Email Verification',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screen.height * 0.025),
          const Text(
            'Check your mail inbox to change password',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(height: screen.height * 0.025),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                );
              },
              child: const Text('Back to Sign In Page'),
            ),
          ),
        ],
      ),
    ));
  }
}
