import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:jct/models/emergency_item.dart';

class EmergencyAlertsCheck extends StatefulWidget {
  const EmergencyAlertsCheck({super.key});

  @override
  State<EmergencyAlertsCheck> createState() => _EmergencyAlertsCheckState();
}

class _EmergencyAlertsCheckState extends State<EmergencyAlertsCheck> {
  var _isLoading = true;
  List<EmergencyItem> _emergencyItems = [];
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final emergencyAlertsUrl = Uri.https(
        'jct-flutter-default-rtdb.firebaseio.com', 'emergency-alerts.json');

    try {
      final emergencyAlertsResponse = await http.get(emergencyAlertsUrl);

      if (emergencyAlertsResponse.statusCode >= 400) {
        setState(() {
          _error = 'Failed to fetch data. Please try again later.';
        });
      }

      if (emergencyAlertsResponse.body == 'null') {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final Map<String, dynamic> listData =
          json.decode(emergencyAlertsResponse.body);
      final List<EmergencyItem> loadItems = [];
      for (final item in listData.entries) {
        loadItems.add(
          EmergencyItem(
            id: item.key,
            title: item.value['title'],
            description: item.value['description'],
          ),
        );
      }
      setState(() {
        _emergencyItems = loadItems;
        _isLoading = false;
      });
      print('Error: ${emergencyAlertsResponse.statusCode}');
    } catch (err) {
      setState(() {
        _error = 'Something went wrong! Please try again later.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No alerts added yet.'),
    );

    if (_isLoading) {
      content = const Center(child: CircularProgressIndicator());
    }

    if (_emergencyItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _emergencyItems.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(_emergencyItems[index].title),
        ),
      );
    }

    if (_error != null) {
      content = Center(
        child: Text(_error!),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text('Emergency Alerts'),
      ),
      body: content,
    );
  }
}
