import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jct/screens/staff/emergency_alerts.dart';
import 'package:jct/screens/staff/reopen_request.dart';
import 'package:jct/widgets/staff_drawer.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({super.key});

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'request') {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ReopenRequest(),
        ),
      );
    }
    if (identifier == 'alerts') {
      if (!context.mounted) {
        return;
      }

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
        centerTitle: true,
        title: const Text('All Complaints'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      drawer: StaffDrawer(
        onSelectScreen: _setScreen,
      ),
      body: const Center(
        child: Text('Complaints Screen'),
      ),
    );
  }
}
