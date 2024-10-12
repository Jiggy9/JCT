import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jct/language/helpers/app_localization_context_extenstion.dart';
import 'package:jct/language/helpers/get_localize_string.dart';
import 'package:jct/models/complaint_item.dart';
import 'package:jct/widgets/user_multiple_image.dart';
import 'package:http/http.dart' as http;

class RaiseComplaint extends StatefulWidget {
  const RaiseComplaint({Key? key}) : super(key: key);

  @override
  State<RaiseComplaint> createState() => _RaiseComplaintState();
}

class _RaiseComplaintState extends State<RaiseComplaint> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _selectedCategory = 'Water Works';
  String _selectedUrgency = 'Low';
  final title = TextEditingController();
  final description = TextEditingController();
  var _enteredTitle = '';
  var _enteredDescription = '';

  List<File> selectedImages = [];

  void handlePickedImages(List<File> pickedImages) {
    setState(() {
      selectedImages = pickedImages;
    });
  }

  void _submitItem() async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();

      final url = Uri.https(
          'jct-flutter-default-rtdb.firebaseio.com', 'complaint-data.json');
      final response = await http.post(
        url,
        headers: {'Content-type': 'application/json'},
        body: json.encode(
          {
            'comp_title': title.text,
            'comp_description': description.text,
            'selectedCategory': _selectedCategory,
            'selectedUrgency': _selectedUrgency,
          },
        ),
      );

      if (!context.mounted) {
        return;
      }

      final Map<String, dynamic> resData = json.decode(response.body);

      Navigator.of(context).pop(
        ComplaintItem(
          id: resData['name'],
          title: _enteredTitle,
          description: _enteredDescription,
          selectedCategory: _selectedCategory,
          selectedUrgency: _selectedUrgency,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _text = context.localizedString;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(_text.complaint_form),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Title Input
                Text('1. ${_text.enter_title}'),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: title,
                    decoration: InputDecoration(
                      hintText: _text.enter_complaint_title,
                      labelText: _text.title,
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(
                          Radius.circular(9.0),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length <= 1 ||
                          value.trim().length > 100) {
                        return _text.complaint_form_error_text;
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _enteredTitle = value!;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Text('2. ${_text.enter_description}'),
                // Description Input
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: description,
                    maxLines: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return _text.complaint_form_description_error;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: _text.enter_description,
                      labelText: _text.description,
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(
                          Radius.circular(9.0),
                        ),
                      ),
                    ),
                    onSaved: (value) {
                      _enteredDescription = value!;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Text('3. ${_text.upload_images}'),
                // Image Picker Button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: UserMultipleImage(
                    onPickedImages: handlePickedImages,
                  ),
                ),
                const SizedBox(height: 10),
                Text('4. ${_text.select_complaint_category}'),
                // Category Dropdown
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: _selectedCategory,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedCategory = newValue!;
                      });
                    },
                    items: <String>[
                      'Light Department',
                      'Underground Drainage',
                      'Solid Waste Management',
                      'Urban Community Development',
                      'General Administrative',
                      'Integrated Child Development Services',
                      'Fire Department',
                      'Health Department',
                      'Birth & Death Department',
                      'Marriage',
                      'Water Works',
                      'Project & Town Planning',
                      'Shop Executive',
                      'Public Relations Officer',
                      'Account & Tax Department',
                      'Civil Department',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(getLocalizedString(context, value)),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 10),
                Text('5. ${_text.select_urgency_level}'),
                // Urgency Level Dropdown
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: _selectedUrgency,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedUrgency = newValue!;
                      });
                    },
                    items: <String>['Low', 'Medium', 'High']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(getLocalizedString(context, value)),
                      );
                    }).toList(),
                  ),
                ),
                // Register Button
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _submitItem,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          _text.submit_complaint,
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
