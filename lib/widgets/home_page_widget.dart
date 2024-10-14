import 'package:flutter/material.dart';
import 'package:jct/language/helpers/app_localization_context_extenstion.dart';
import 'package:jct/screens/user/usefull/emergency_alerts_check.dart';
import 'package:jct/screens/user/usefull/raise_complaint.dart';
import 'package:jct/screens/user/usefull/reopen_complaints.dart';
import 'package:jct/screens/user/usefull/user_complaints.dart';
import 'package:jct/widgets/container_widget.dart';
// import 'package:jct/widgets/grid_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(24),
      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 1,
      //   childAspectRatio: 2.6,
      //   crossAxisSpacing: 20,
      //   mainAxisSpacing: 20,
      // ),
      //  crossAxisCount: 1,
      // childAspectRatio: 2.6,
      // crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      crossAxisCount: 1,

      children: [
        ContainerWidget(
            cardImage: "assets/images/raise-complaint.jpg",
            cardText: context.localizedString.raise_complaints_title,
            onSelectGrid: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RaiseComplaint(),
                ),
              );
            },
            cardTextColor: Colors.black),
        ContainerWidget(
            cardImage: "assets/images/ongoing-complaints.jpg",
            cardText: context.localizedString.ongoing_complaints_title,
            onSelectGrid: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const UserComplaints(),
                ),
              );
            },
            cardTextColor: Colors.indigo),
        ContainerWidget(
            cardImage: "assets/images/completed.jpeg",
            cardText: context.localizedString.completed_complaints_title,
            onSelectGrid: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ReopenComplaints(),
                ),
              );
            },
            cardTextColor: Colors.green.shade700),
        ContainerWidget(
            cardImage: "assets/images/emergency-alert.jpg",
            cardText: context.localizedString.emergency_alert_title,
            onSelectGrid: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EmergencyAlertsCheck(),
                ),
              );
            },
            cardTextColor: Colors.redAccent.shade700),
      ],
    );
  }
}
