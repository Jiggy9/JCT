import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jct/models/complaint_item.dart';
import 'package:jct/screens/staff/emergency_alerts.dart';
import 'package:jct/screens/staff/reopen_request.dart';
import 'package:http/http.dart' as http;
import 'package:jct/screens/user/usefull/detailed_complaint.dart';

import 'package:jct/widgets/staff_drawer.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({super.key});

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  var _isLoading = true;
  List<ComplaintItem> _complaintItems = [];
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
        'jct-flutter-default-rtdb.firebaseio.com', 'complaint-data.json');

    try {
      final response = await http.get(url);

      if (response.statusCode >= 400) {
        setState(() {
          _error = 'Failed to fetch data. Please try again later.';
        });
      }

      if (response.body == 'null') {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final Map<String, dynamic> listData = json.decode(response.body);
      final List<ComplaintItem> loadItems = [];
      for (final item in listData.entries) {
        loadItems.add(
          ComplaintItem(
            id: item.key,
            title: item.value['comp_title'],
            description: item.value['comp_description'],
            selectedCategory: item.value['selectedCategory'],
            selectedUrgency: item.value['selectedUrgency'],
          ),
        );
      }
      setState(() {
        _complaintItems = loadItems;
        _isLoading = false;
      });
    } catch (err) {
      setState(() {
        _error = 'Something went wrong! Please try again later.';
      });
    }
  }

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

  Future<void> _refreshData() async {
    // Reload the data here, for example:
    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No complaints added yet.'),
    );

    if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_complaintItems.isNotEmpty) {
      content = ListView.separated(
        itemCount: _complaintItems.length,
        itemBuilder: (ctx, index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailedPage(
                  complaintItem: _complaintItems[index],
                ),
              ),
            );
          },
          child: ListTile(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            title: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(_complaintItems[index].title),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(_complaintItems[index].description),
            ),
            titleTextStyle: Theme.of(context).textTheme.titleLarge,
            subtitleTextStyle: Theme.of(context).textTheme.bodyMedium,
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 2,
          );
        },
      );
    }

    if (_error != null) {
      content = Center(
        child: Text(_error!),
      );
    }

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
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: content,
      ),
    );
  }
}
