import 'package:flutter/material.dart';

class EmergencyAlertsCheck extends StatelessWidget {
  const EmergencyAlertsCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Alerts'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('all emergency alerts show here for users'),
      ),
    );
  }
}
