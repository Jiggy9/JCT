import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jct/models/complaint_item.dart';

class UserComplaints extends StatefulWidget {
  const UserComplaints({super.key});

  @override
  State<UserComplaints> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<UserComplaints> {
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

  void _removeItem(ComplaintItem item) async {
    final index = _complaintItems.indexOf(item);
    setState(() {
      _complaintItems.remove(item);
    });
    final url = Uri.https('jct-flutter-default-rtdb.firebaseio.com',
        'complaint-data/${item.id}.json');

    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      setState(() {
        _complaintItems.insert(index, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No complaints added yet.'),
    );

    if (_isLoading) {
      content = const Center(child: CircularProgressIndicator());
    }

    if (_complaintItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _complaintItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) {
            _removeItem(_complaintItems[index]);
          },
          key: ValueKey(_complaintItems[index].id),
          child: ListTile(
            title: Text(_complaintItems[index].title),
          ),
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
        title: const Text('Your Complaints'),
      ),
      body: content,
    );
  }
}
