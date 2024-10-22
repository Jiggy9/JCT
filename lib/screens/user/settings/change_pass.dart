import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jct/language/helpers/app_localization_context_extenstion.dart';
import 'package:jct/main.dart';
import 'package:jct/screens/user/settings/info_screen.dart';
import 'package:jct/theme/app_theme/app_theme.dart';

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
    // final theme = Theme.of(context).colorScheme;
    final appTheme = context.theme.appColors;
    final _text = context.localizedString;
    return Scaffold(
      backgroundColor: context.theme.appColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: appTheme.onPrimary,
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
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: appTheme.onSurface),
                        borderRadius: BorderRadius.circular(18)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: appTheme.onSurface, width: 2.0),
                        borderRadius: BorderRadius.circular(18)),
                    // enabled: true,
                    // focusColor: appTheme.secondary,
                    fillColor: appTheme.primary,
                    suffixIcon: togglePassword(true),
                    hintText: _text.enter_old_password,
                    hintStyle: TextStyle(color: appTheme.surface),
                    filled: true,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  errorMessage,
                  style: TextStyle(
                    color: appTheme.error,
                  ),
                ),
                SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: appTheme.background,
                        side: BorderSide(color: appTheme.onSurface)),
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
                    child: Text(
                      _text.verify,
                      style: TextStyle(color: appTheme.onPrimary),
                    ),
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
