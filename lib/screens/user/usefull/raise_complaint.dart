import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:jct/screens/user/usefull/complaint_item.dart';
import 'package:jct/widgets/user_multiple_image.dart';
import 'package:http/http.dart' as http;

class RaiseComplaint extends StatefulWidget {
  const RaiseComplaint({Key? key}) : super(key: key);

  @override
  State<RaiseComplaint> createState() => _RaiseComplaintState();
}

class _RaiseComplaintState extends State<RaiseComplaint> {
  Map userData = {};
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String selectedCategory =
      'Light Department'; // Initialize with the default category
  String selectedUrgency = 'Low'; // Initialize with the default urgency level
  final title = TextEditingController();
  final description = TextEditingController();

  // Define a variable to store the selected image

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
          'jct-flutter-default-rtdb.firebaseio.com', 'complaints-data.json');
      final response = await http.post(
        url,
        headers: {'Content-type': 'application/json'},
        body: json.encode(
          {
            'comp_title': title.text,
            'comp_description': description.text,
            'selectedCategory': selectedCategory,
            'selectedUrgency': selectedUrgency,
          },
        ),
      );

      final Map<String, dynamic> resData = json.decode(response.body);

      if (!context.mounted) {
        return;
      }

      print('form submiitted');
      print('${title.text}, title');
      print('${description.text}, description');
      print('selectedCategory, $selectedCategory');
      print('selectedUrgency, $selectedUrgency');

      Navigator.of(context).pop(
        ComplaintItem(
          id: resData['name'],
          title: title.text,
          description: description.text,
          selectedCategory: selectedCategory,
          selectedImages: selectedImages,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaint Form'),
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
                const Text('1. Enter Title:'),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: title,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Title is required'),
                      MinLengthValidator(3,
                          errorText: 'Minimum 3 characters for title'),
                    ]),
                    decoration: const InputDecoration(
                      hintText: 'Enter complaint Title',
                      labelText: 'Title',
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(
                          Radius.circular(9.0),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text('2. Enter Description:'),
                // Description Input
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: description,
                    maxLines: null,
                    validator: MultiValidator(
                      [
                        RequiredValidator(errorText: 'Description is required'),
                        MinLengthValidator(10,
                            errorText: 'Minimum 10 characters for description'),
                      ],
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Enter Description',
                      labelText: 'Description',
                      errorStyle: TextStyle(fontSize: 18.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(
                          Radius.circular(9.0),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text('3. Upload Images:'),
                // Image Picker Button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: UserMultipleImage(
                    onPickedImages: handlePickedImages,
                  ),
                ),
                const SizedBox(height: 10),
                const Text('4. Select Complaint Category:'),
                // Category Dropdown
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: selectedCategory,
                    onChanged: (newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                      });
                    },
                    items: <String>[
                      'Light Department',
                      'Underground Drainage',
                      'Solid Waste Management',
                      'Urban Community Development',
                      'General Administrative',
                      'Integrated Child Development Services',
                      'Fire Depatment',
                      'Health Department',
                      'Birth & Death Department',
                      'Marriage',
                      'Water Works',
                      'Project & Town Planning',
                      'Shop Execituve',
                      'Public Relations Officer',
                      'Account & Tax Department',
                      'Civil Department',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 10),
                const Text('5. Select Urgency Level:'),
                // Urgency Level Dropdown
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: selectedUrgency,
                    onChanged: (newValue) {
                      setState(() {
                        selectedUrgency = newValue!;
                      });
                    },
                    items: <String>['Low', 'Medium', 'High']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
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
                        child: const Text(
                          'Submit Complaint',
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
