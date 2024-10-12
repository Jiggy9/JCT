import 'package:flutter/material.dart';
import 'package:jct/language/helpers/app_localization_context_extenstion.dart';
import 'package:jct/screens/user/settings/account.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final text = context.localizedString;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          text.settings,
          // style: TextStyle(
          //   fontSize: 22,
          //   fontWeight: FontWeight.bold,
          // ),
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
        menuItem(1, context.localizedString.account, Icons.person),
        menuItem(2, context.localizedString.about, Icons.home)
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
