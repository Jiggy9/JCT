import 'package:flutter/material.dart';
import 'package:jct/screens/feedback/feedback_screen/feedback_screen.dart';

import 'package:jct/screens/user/settings/settings_page.dart';
import 'package:jct/screens/user/usefull/emergency_alerts_check.dart';
import 'package:jct/screens/user/usefull/profile_page.dart';
import 'package:jct/screens/user/usefull/raise_complaint.dart';
import 'package:jct/screens/user/usefull/reopen_complaints.dart';
import 'package:jct/screens/user/usefull/user_complaints.dart';
import 'package:jct/widgets/grid_item.dart';
import 'package:jct/widgets/user_drawer.dart';

class ImportantScreen extends StatefulWidget {
  const ImportantScreen({super.key});

  @override
  State<ImportantScreen> createState() => _ImportantScreenState();
}

class _ImportantScreenState extends State<ImportantScreen> {
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Jamnagar Complaint Tracer',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2.6,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          GridItem(
            title: 'Raise Complaint',
            onSelectGrid: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RaiseComplaint(),
                ),
              );
            },
          ),
          GridItem(
            title: 'Ongoing Complaints',
            onSelectGrid: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const UserComplaints(),
                ),
              );
            },
          ),
          GridItem(
            title: 'Completed Complaints',
            onSelectGrid: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ReopenComplaints(),
                ),
              );
            },
          ),
          GridItem(
            title: 'Emergency Alerts',
            onSelectGrid: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EmergencyAlertsCheck(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
