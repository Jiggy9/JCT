import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:jct/screens/bottom_navigation/provider/bottom_nav_provider.dart';
import 'package:jct/screens/feedback/feedback_screen/feedback_screen.dart';
import 'package:jct/screens/user/settings/settings_page.dart';
import 'package:jct/widgets/home_page_widget.dart';

class BottomNavigationScreen extends ConsumerWidget {
  const BottomNavigationScreen({required this.currentIndex, super.key});
  final int currentIndex;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // list

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        // ref.read(bottomNavigationBarIndexProvider(newCurrentIndex: index));
        ref.read(bottomNavigationBarIndexProvider.notifier).updateIndex(index);
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings"),
        BottomNavigationBarItem(icon: Icon(Icons.feedback), label: "feedback"),
      ],
      selectedItemColor: Colors.indigo,
      unselectedItemColor: Colors.black54,
      unselectedIconTheme: IconThemeData(size: 28),
      // unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500,),

      showUnselectedLabels: true,
      showSelectedLabels: false,
      // selectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
      unselectedFontSize: 14,
      selectedIconTheme: IconThemeData(size: 40),
      // backgroundColor: Colors.transparent.withOpacity(0.5),
      elevation: 0,
      useLegacyColorScheme: false,
      // landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
    );
  }
}

List<Widget> pages = [
  HomePage(),
  SettingsPage(),
  FeedbackScreen(),
];
