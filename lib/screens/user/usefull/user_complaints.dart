import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jct/language/helpers/app_localization_context_extenstion.dart';
import 'package:jct/models/complaint_item.dart';
import 'package:jct/screens/user/usefull/detailed_complaint.dart';
import 'package:jct/theme/app_theme/app_theme.dart';

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
    Widget content = Center(
      child: Text(context.localizedString.no_complaint_added),
    );

    if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_complaintItems.isNotEmpty) {
      content = ListView.separated(
        itemCount: _complaintItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) {
            _removeItem(_complaintItems[index]);
          },
          key: ValueKey(_complaintItems[index].id),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14),
            child: InkWell(
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
                  side: BorderSide(
                      width: 2, color: context.theme.appColors.onPrimary),
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(_complaintItems[index].title),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    _complaintItems[index].description,
                    style:
                        TextStyle(color: context.theme.appColors.onBackground),
                  ),
                ),
                titleTextStyle: Theme.of(context).textTheme.titleLarge,
                subtitleTextStyle: Theme.of(context).textTheme.bodyMedium,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: context.theme.appColors.secondary,
                ),
              ),
            ),
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
      backgroundColor: context.theme.appColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: context.theme.appColors.onPrimary,
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
            context.localizedString.your_complaints(_complaintItems.length)),
      ),
      body: content,
    );
  }
}
