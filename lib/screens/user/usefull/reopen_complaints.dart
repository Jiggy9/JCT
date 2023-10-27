import 'package:flutter/material.dart';

Widget listTile(var title, var subtitle) {
  return ListTile(
    title: Text(title),
    subtitle: Text(subtitle),
    leading: const Icon(Icons.person),
    trailing:
        IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
    onTap: () {},
  );
}

class ReopenComplaints extends StatelessWidget {
  const ReopenComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reopen Complaints'),
      ),
      body: const Center(
        child: Text('Uh oh.. nothing here!'),
      ),
    );
  }
}