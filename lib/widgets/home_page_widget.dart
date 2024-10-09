import 'package:flutter/material.dart';
import 'package:jct/screens/user/usefull/emergency_alerts_check.dart';
import 'package:jct/screens/user/usefull/raise_complaint.dart';
import 'package:jct/screens/user/usefull/reopen_complaints.dart';
import 'package:jct/screens/user/usefull/user_complaints.dart';
import 'package:jct/widgets/grid_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
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
    );
  }
}
