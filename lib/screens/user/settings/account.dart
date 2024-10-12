import 'package:flutter/material.dart';
import 'package:jct/language/helpers/app_localization_context_extenstion.dart';
import 'package:jct/screens/user/settings/change_pass.dart';
import 'package:jct/screens/user/settings/settings_page.dart';
import 'package:jct/screens/user/usefull/profile_page.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => AccountState();
}

class AccountState extends State<Account> {
  bool valNotify = true;

  onChangeFunction(bool newValue1) {
    setState(() {
      valNotify = newValue1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _text = context.localizedString;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 85),
          child: Text(
            _text.settings,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const SettingsPage(),
              //     ),
              //   );
              // },
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const SizedBox(height: 40),
            Row(
              children: [
                const Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                const SizedBox(width: 10),
                Text(
                  _text.account,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 100),
              ],
            ),
            const Divider(height: 20, thickness: 1),
            const SizedBox(height: 10),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _text.profile,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
            ),

            //const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePassword(),
                  ),
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _text.change_password,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
