import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jct/screens/bottom_navigation/provider/bottom_nav_provider.dart';
import 'package:jct/screens/bottom_navigation/screen/bottom_navigation.dart';
import 'package:jct/theme/app_theme/app_theme.dart';
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
    final theme = Theme.of(context).colorScheme;
    final appTheme = context.theme.appColors;
    final _currentIndex = ref.watch(bottomNavigationBarIndexProvider) as int;
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.background,
        appBar: AppBar(
          backgroundColor: appTheme.primary,
          foregroundColor: appTheme.onPrimary,
          toolbarHeight: 80,
          leading: IconButton(
            icon: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.jpg'),
              radius: 20, // You can adjust the radius for size
            ),
            onPressed: () {},
          ),
          // centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
            ),
            child: Text(
              maxLines: 3,
              context.localizedString.app_title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                // color: appTheme.onPrimary,
              ),
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
      ),
    );
  }
}
