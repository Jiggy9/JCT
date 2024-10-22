import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:jct/language/helpers/app_localization_context_extenstion.dart';
import 'package:jct/main.dart';
import 'package:jct/screens/user/settings/account.dart';
import 'package:jct/theme/app_theme/app_theme.dart';
import 'package:jct/theme/app_theme/provider/theme_provider.dart';
import 'package:jct/theme/app_theme/provider/value_provider.dart';
import 'package:jct/theme/colors.dart';

// class SettingsPage extends StatefulWidget {
//   const SettingsPage({Key? key}) : super(key: key);

//   @override
//   State<SettingsPage> createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   bool switchValue = false;
//   @override
//   Widget build(BuildContext context) {
//     // final theme = Theme.of(context).colorScheme;
//     // final appTheme = context.theme.
//     final appTheme = context.theme.appColors;
//     final text = context.localizedString;
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         // backgroundColor: appTheme.primary,
//         title: Text(
//           text.settings,
//           // style: TextStyle(
//           //   fontSize: 22,
//           //   fontWeight: FontWeight.bold,
//           // ),
//         ),
//       ),
//       // backgroundColor: appTheme.background,
//       body: myDrawerList(),
//     );
//   }

//   Widget myDrawerList() {
//     return Container(
//       color: context.theme.appColors.background,
//       padding: const EdgeInsets.only(top: 15),
//       child: Column(children: [
//         menuItem(1, context.localizedString.account, Icons.person),
//         menuItem(2, context.localizedString.about, Icons.home),
//         SizedBox(height: 16.0),
//         Container(
//           child: Row(
//             children: [
//               Text("Change app Theme"),
//               SizedBox(width: 24),
//               // switch
//               AnimatedToggleSwitch.dual(
//                 current: switchValue,
//                 first: false,
//                 second: true,
//                 spacing: 50,
//                 style: ToggleStyle(borderColor: Colors.transparent, boxShadow: [
//                   BoxShadow(
//                       color: Colors.black26,
//                       spreadRadius: 1,
//                       blurRadius: 2.0,
//                       offset: Offset(0, 3)),
//                 ]),
//                 borderWidth: 5.0,
//                 height: 55,
//                 onChanged: (value) {
//                   print("Value before setsstate::: ${value} || ${switchValue}");
//                   setState(() {
//                     switchValue = value;
//                   });
//                   print("Value after setsstate::: ${value}|| ${switchValue}");
//                 },
//                 styleBuilder: (value) => ToggleStyle(
//                     indicatorColor:
//                         value ? Colors.purple.shade400 : Colors.yellow),
//                 iconBuilder: (value) => value
//                     ? Icon(Icons.nights_stay_rounded)
//                     : Icon(
//                         Icons.sunny,
//                         color: Colors.black,
//                       ),
//                 textBuilder: (value) => value
//                     ? Center(
//                         child: Text("Dark Mode"),
//                       )
//                     : Center(
//                         child: Text("Light Mode"),
//                       ),
//                 // styleList: [ToggleStyle(backgroundColor: Colors.indigo)],
//               )
//             ],
//           ),
//         )
//       ]),
//     );
//   }

//   Widget menuItem(
//     int id,
//     String title,
//     IconData icon,
//   ) {
//     return Material(
//       child: InkWell(
//         onTap: () {
//           setState(() {
//             if (id == 1) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const Account(),
//                 ),
//               );
//             } else if (id == 2) {
//               //add apps info
//             }
//           });
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Row(children: [
//             Expanded(
//                 child: Icon(
//               icon,
//               size: 20,
//               color: context.theme.appColors.secondary,
//             )),
//             Expanded(
//               flex: 3,
//               child: Text(
//                 title,
//                 style: TextStyle(
//                     // background: context.theme.appColors.background,
//                     color: context.theme.appColors.onBackground,
//                     fontSize: 22),
//               ),
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final switchValue = ref.watch(valueNotifierProvider);
    // final swithProvider = ref.watch(themeNotifierProvider);
    final appTheme = context.theme.appColors;
    final text = context.localizedString;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: appTheme.primary,
        title: Text(
          text.settings,
          // style: TextStyle(
          //   fontSize: 22,
          //   fontWeight: FontWeight.bold,
          // ),
        ),
      ),
      // backgroundColor: appTheme.background,
      body: myDrawerList(switchValue),
    );
  }

  // ?flsjfl
  Widget myDrawerList(bool switchValue) {
    return Container(
      color: context.theme.appColors.background,
      padding: const EdgeInsets.only(top: 15),
      child: Column(children: [
        menuItem(1, context.localizedString.account, Icons.person),
        menuItem(2, context.localizedString.about, Icons.home),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Change app Theme",
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(width: 24),
              // switch
              AnimatedToggleSwitch.dual(
                current: switchValue,
                first: false,
                second: true,
                spacing: 50,
                // loading: true,
                // loadingAnimationDuration: Duration(seconds: 1),
                // loadingAnimationCurve: Curves.easeInCirc,
                style: ToggleStyle(
                    borderColor: Colors.transparent,
                    // backgroundGradient: LinearGradient(colors: [
                    //   context.theme.appColors.background,
                    //   context.theme.appColors.onSurface,
                    // ]),
                    backgroundColor: context.theme.appColors.secondary,
                    boxShadow: [
                      const BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1,
                          blurRadius: 2.0,
                          offset: Offset(0, 2)),
                    ]),
                borderWidth: 3.0,
                height: 52,
                // onChanged: (value) {
                //   print("Value before setsstate::: ${value} || ${switchValue}");
                //   setState(() {
                //     switchValue = value;
                //   });
                //   print("Value after setsstate::: ${value}|| ${switchValue}");
                // },
                onChanged: (value) {
                  // print(value);
                  // switchValue = value;
                  ref.read(valueNotifierProvider.notifier).updateValue(value);
                  ref.read(themeNotifierProvider.notifier).switchTheme(value);
                  // print(value);
                },
                styleBuilder: (value) => ToggleStyle(
                    indicatorColor: value
                        ? context.theme.appColors.background
                        : Colors.yellow),
                iconBuilder: (value) => value
                    ? const Icon(Icons.nights_stay_rounded)
                    : const Icon(
                        Icons.sunny,
                        color: Colors.black,
                      ),
                textBuilder: (value) => value
                    ? Center(
                        child: Text(
                          "Dark Mode",
                          style: TextStyle(
                              color: context.theme.appColors.onBackground),
                        ),
                      )
                    : const Center(
                        child: Text("Light Mode"),
                      ),

                animationDuration: const Duration(milliseconds: 800),
                // styleList: [ToggleStyle(backgroundColor: Colors.indigo)],
              )
            ],
          ),
        )
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
              color: context.theme.appColors.secondary,
            )),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: TextStyle(
                    // background: context.theme.appColors.background,
                    color: context.theme.appColors.onBackground,
                    fontSize: 22),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
