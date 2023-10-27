
import 'package:flutter/material.dart';
import 'package:jct/screens/user/usefull/profile_page.dart';
import 'package:jct/screens/user/usefull/raise_complaint.dart';
import 'package:jct/screens/user/usefull/reopen_complaints.dart';
import 'package:jct/screens/user/user_complaints.dart';

import 'package:jct/widgets/grid_item.dart';
import 'package:jct/widgets/main_drawer.dart';
import 'package:jct/screens/user/usefull/emergency_alerts.dart';

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
    if (identifier == 'alerts') {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const EmergencyAlerts(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jamnagar Complain Tracer'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
            icon: const Icon(Icons.settings),
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
            title: 'Your Complaints & Status',
            onSelectGrid: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const UserComplaints(),
                ),
              );
            },
          ),
          GridItem(
            title: 'Emergency Alerts',
            onSelectGrid: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EmergencyAlerts(),
                ),
              );
            },
          ),
          GridItem(
            title: 'Reopen Complaints',
            onSelectGrid: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ReopenComplaints(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
