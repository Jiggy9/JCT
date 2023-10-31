import 'package:flutter/material.dart';

class ReopenRequest extends StatelessWidget {
  const ReopenRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reopen Complaints Request'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Reopen Requests'),
      ),
    );
  }
}
