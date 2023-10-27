import 'package:flutter/material.dart';

class Query extends StatelessWidget {
  const Query({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Final step of Form'),
      ),
      body: const Center(
        child: Text('Select appropriate answers'),
      ),
    );
  }
}
