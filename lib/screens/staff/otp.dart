import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'branch_login.dart';
import 'home.dart';
import 'package:pinput/pinput.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final otpController = TextEditingController();
  String errorMessage = '';
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final defaultPinTheme = PinTheme(
      width: screen.height * 0.06,
      height: screen.height * 0.06,
      textStyle: const TextStyle(fontSize: 20),
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(width: 1.5, color: Colors.blue),
      borderRadius: BorderRadius.circular(10),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromARGB(255, 175, 211, 255),
      ),
    );
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('OTP Verification', style: TextStyle(fontSize: 25)),
              SizedBox(height: screen.height * 0.025),
              Pinput(
                controller: otpController,
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                showCursor: true,
              ),
              SizedBox(height: screen.height * 0.025),
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
              SizedBox(height: screen.height * 0.025),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: BranchLogin.verify,
                              smsCode: otpController.text);
                      await FirebaseAuth.instance
                          .signInWithCredential(credential)
                          .then((value) => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                ),
                              });
                      errorMessage = '';
                    } on FirebaseAuthException catch (error) {
                      errorMessage = error.message!;
                      print(errorMessage);
                      if (errorMessage ==
                          'Unable to establish connection on channel.') {
                        errorMessage = 'OTP is Required';
                      }
                      if (errorMessage ==
                          'The verification code from SMS/TOTP is invalid. Please check and enter the correct verification code again.') {
                        errorMessage = 'Invalid OTP';
                      }
                    }
                    setState(() {});
                  },
                  child: const Text('Verify OTP'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BranchLogin(),
                    ),
                  );
                },
                child: const Text('Edit Phone Number'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
