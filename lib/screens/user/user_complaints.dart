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

class UserComplaints extends StatefulWidget {
  const UserComplaints({super.key});

  @override
  State<UserComplaints> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<UserComplaints> {
  @override
  Widget build(BuildContext context) {
    // var title = ['Title'];
    // var subtitle = ['Location'];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Complaints'),
          
        ),
        body: ListView(
          children: [
            for (int i = 0; i < 15; i++) listTile('${i + 1}: Title', 'Category')
          ],
        ));
  }
}
