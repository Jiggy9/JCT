import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jct/screens/staff/branch_login.dart';
import 'package:jct/screens/staff/complaints_screen.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final code = TextEditingController();
  String errorMessage = '';

  String? validateCode(String? formCode) {
    if (formCode == null || formCode.isEmpty) {
      return 'Code is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('OTP Verification', style: TextStyle(fontSize: 25)),
                SizedBox(height: screen.height * 0.025),
                TextFormField(
                  validator: validateCode,
                  controller: code,
                  decoration: const InputDecoration(
                    hintText: 'Enter 6-Digit Code',
                    filled: true,
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                SizedBox(height: screen.height * 0.02),
                Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        try {
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: BranchLogin.verify,
                                  smsCode: code.text);
                          await FirebaseAuth.instance
                              .signInWithCredential(credential)
                              .then(
                                (value) => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ComplaintsScreen(),
                                    ),
                                  ),
                                },
                              );
                          errorMessage = '';
                        } on FirebaseAuthException catch (error) {
                          errorMessage = error.message!;
                          if (errorMessage ==
                              'Unable to establish connection on channel.') {
                            errorMessage = 'Code is Required';
                          }
                          if (errorMessage ==
                              'The verification code from SMS/TOTP is invalid. Please check and enter the correct verification code again.') {
                            errorMessage = 'Invalid Code';
                          }
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
      ),
    );
  }
}
