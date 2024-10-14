import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:jct/cubit/bottom_navigation_cubit.dart';
import 'package:jct/language/helpers/app_localization_context_extenstion.dart';
import 'package:jct/language/helpers/language_popup.dart';
import 'package:jct/screens/feedback/feedback_screen/feedback_screen.dart';
import 'package:jct/screens/user/settings/settings_page.dart';
import 'package:jct/screens/user/usefull/emergency_alerts_check.dart';
import 'package:jct/screens/user/usefull/profile_page.dart';
import 'package:jct/screens/user/usefull/user_complaints.dart';
import 'package:jct/widgets/home_page_widget.dart';
import 'package:jct/widgets/main_drawer.dart';

class ImportantScreen extends StatefulWidget {
  const ImportantScreen({super.key});

  @override
  State<ImportantScreen> createState() => _ImportantScreenState();
}

class _ImportantScreenState extends State<ImportantScreen> {
  final List<Widget> pages = const [
    HomePage(),
    SettingsPage(),
    FeedbackScreen(),
    ProfilePage(),
  ];

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'monitoring') {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const UserComplaints(),
        ),
      );
    } else if (identifier == 'settings') {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SettingsPage(),
        ),
      );
    } else if (identifier == 'alerts') {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const EmergencyAlertsCheck(),
        ),
      );
    } else if (identifier == 'feedback') {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const FeedbackScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = context.localizedString;
    return BlocBuilder<BottomNavigationCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.jpg'),
                radius: 20,
              ),
              onPressed: () {},
            ),
            centerTitle: true,
            title: Text(
              text.app_title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: LanguagePopupMenu(),
              ),
            ],
          ),
          drawer: MainDrawer(
            onSelectScreen: _setScreen,
          ),
          body: pages[currentIndex],
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: currentIndex,
            onTap: (index) {
              context.read<BottomNavigationCubit>().updateIndex(index);
            },
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: Text(text.home),
                selectedColor: Colors.purple,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.settings),
                title: Text(text.settings),
                selectedColor: Colors.orange,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.feedback),
                title: Text(text.feedback),
                selectedColor: Colors.green,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.person),
                title: Text(text.profile),
                selectedColor: Colors.blue,
              ),
            ],
          ),
        );
      },
    );
  }
}
