import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jct/models/emergency_item.dart';
import 'package:jct/widgets/new_alert.dart';

class EmergencyAlerts extends StatefulWidget {
  const EmergencyAlerts({super.key});

  @override
  State<EmergencyAlerts> createState() => _EmergencyAlertsState();
}

class _EmergencyAlertsState extends State<EmergencyAlerts> {
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

      final Map<String, dynamic> listData = json.decode(emergencyAlertsResponse.body);
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
    } catch (err) {
      setState(() {
        _error = 'Something went wrong! Please try again later.';
      });
    }
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<EmergencyItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewAlert(),
      ),
    );

    if (newItem == null) return;

    setState(() {
      _emergencyItems.add(newItem);
    });
  }

  void _removeItem(EmergencyItem item) async {
    final index = _emergencyItems.indexOf(item);
    setState(() {
      _emergencyItems.remove(item);
    });
    final url = Uri.https('jct-flutter-default-rtdb.firebaseio.com',
        'emergency-alerts/${item.id}.json');

    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      setState(() {
        _emergencyItems.insert(index, item);
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
      content = ListView.separated(
        itemCount: _emergencyItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) {
            _removeItem(_emergencyItems[index]);
          },
          key: ValueKey(_emergencyItems[index].id),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(_emergencyItems[index].title),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(_emergencyItems[index].description),
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
        title: const Text('Emergency Alerts'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
