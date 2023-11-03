import 'package:flutter/material.dart';
import 'package:jct/screens/user/settings/account.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: myDrawerList(),
    );
  }

  Widget myDrawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(children: [
        menuItem(1, 'Account', Icons.person),
       
        menuItem(2, 'About', Icons.home)
      ]),
    );
  }

  Widget menuItem(
    int id,
    String title,
    IconData icon,
  ) {
    return Material(
      child: InkWell(
        onTap: () {
          setState(() {
            if (id == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Account(),
                ),
              );
            } else if (id == 2) {
              //add apps info
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(children: [
            Expanded(
                child: Icon(
              icon,
              size: 20,
            )),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 22),
              ),
            )
          ]),
        ),
      ),
    );
  }

}

