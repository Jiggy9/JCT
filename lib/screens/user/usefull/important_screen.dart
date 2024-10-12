import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jct/language/helpers/app_localization_context_extenstion.dart';
import 'package:jct/language/helpers/language_popup.dart';
import 'package:jct/screens/bottom_navigation/provider/bottom_nav_provider.dart';
import 'package:jct/screens/bottom_navigation/screen/bottom_navigation.dart';
import 'package:jct/screens/feedback/feedback_screen/feedback_screen.dart';

import 'package:jct/screens/user/settings/settings_page.dart';
import 'package:jct/screens/user/usefull/emergency_alerts_check.dart';
import 'package:jct/screens/user/usefull/profile_page.dart';
import 'package:jct/screens/user/usefull/raise_complaint.dart';
import 'package:jct/screens/user/usefull/reopen_complaints.dart';
import 'package:jct/screens/user/usefull/user_complaints.dart';
import 'package:jct/widgets/grid_item.dart';
import 'package:jct/widgets/home_page_widget.dart';
import 'package:jct/widgets/user_drawer.dart';

// class ImportantScreen extends StatefulWidget {
//   const ImportantScreen({super.key});

//   @override
//   State<ImportantScreen> createState() => _ImportantScreenState();
// }

// class _ImportantScreenState extends State<ImportantScreen> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           'Jamnagar Complaint Tracer',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const ProfilePage(),
//                 ),
//               );
//             },
//             icon: const Icon(Icons.person),
//           ),
//         ],
//       ),
//       drawer: MainDrawer(
//         onSelectScreen: _setScreen,
//       ),
//       body: pages[],
//       // bottomNavigationBar: BottomNavigationBar(items: []),
//       bottomNavigationBar: BottomNavigationScreen(),
//     );
//   }
// }

class ImportantScreen extends ConsumerStatefulWidget {
  const ImportantScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ImportantScreenState();
}

class _ImportantScreenState extends ConsumerState<ImportantScreen> {
  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'monitoring') {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const UserComplaints(),
        ),
      );
    }
    if (identifier == 'settings') {
      if (!context.mounted) {
        return;
      }
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SettingsPage(),
        ),
      );
    }
    if (identifier == 'alerts') {
      if (!context.mounted) {
        return;
      }
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const EmergencyAlertsCheck(),
        ),
      );
    }
    if (identifier == 'feedback') {
      if (!context.mounted) {
        return;
      }
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const FeedbackScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _currentIndex = ref.watch(bottomNavigationBarIndexProvider) as int;
    return Scaffold(
      appBar: AppBar(
       leading: IconButton(
  icon: CircleAvatar(
    backgroundImage: AssetImage('assets/images/logo.jpg'),
    radius: 20, // You can adjust the radius for size
  ),
  onPressed: () {},
),

        centerTitle: true,
        title: Text(
          context.localizedString.app_title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          // IconButton(
          //   onPressed: () {
          //     // Navigator.push(
          //     //   context,
          //     //   MaterialPageRoute(
          //     //     builder: (context) => const ProfilePage(),
          //     //   ),
          //     // );
          //     // LanguagePopupMenu();
          //   },
          //   icon: const Icon(Icons.language_sharp),
          // ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: LanguagePopupMenu(),
          )
        ],
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: _setScreen,
      // ),
      body: pages[_currentIndex],
      // bottomNavigationBar: BottomNavigationBar(items: []),
      bottomNavigationBar: BottomNavigationScreen(
        currentIndex: _currentIndex,
      ),
    );
  }
}
