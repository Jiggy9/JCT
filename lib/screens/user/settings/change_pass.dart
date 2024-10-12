import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jct/language/helpers/app_localization_context_extenstion.dart';
import 'package:jct/screens/user/settings/info_screen.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String errorMessage = '';
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isPasswordType = true;
  final email = FirebaseAuth.instance.currentUser!.email;
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _text = context.localizedString;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(_text.home),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_text.change_password,
                    style: const TextStyle(fontSize: 25)),
                const SizedBox(height: 20),
                TextFormField(
                  validator: validatePassword,
                  controller: password,
                  obscureText: isPasswordType,
                  decoration: InputDecoration(
                    suffixIcon: togglePassword(true),
                    hintText: _text.enter_old_password,
                    filled: true,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  errorMessage,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email!, password: password.text)
                              .then(
                            (value) async {
                              await FirebaseAuth.instance
                                  .sendPasswordResetEmail(email: email!);

                              if (!context.mounted) {
                                return;
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const InfoScreen(),
                                ),
                              );
                            },
                          );
                          errorMessage = '';
                        } on FirebaseAuthException catch (error) {
                          errorMessage = error.message!;
                          if (errorMessage == _text.firebase_auth_error) {
                            errorMessage = _text.invalid_password;
                          }
                        }
                      }
                      setState(() {});
                    },
                    child: Text(_text.verify),
                  ),
                ),
              ],
            ),
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

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty) {
      return context.localizedString.password_is_required;
    }
    return null;
  }
}
