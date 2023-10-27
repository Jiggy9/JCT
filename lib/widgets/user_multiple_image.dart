import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserMultipleImage extends StatefulWidget {
  const UserMultipleImage({
    Key? key,
    required this.onPickedImages,
  }) : super(key: key);

  final void Function(List<File> pickedImages) onPickedImages;

  @override
  State<UserMultipleImage> createState() => _UserMultipleImageState();
}

class _UserMultipleImageState extends State<UserMultipleImage> {
  final List<File> _pickedImages = [];

  void _pickImage() async {
    final pickedImage = await ImagePicker().pickMultiImage(
      imageQuality: 50,
      maxWidth: 150,
    );

    final pickedImageFiles = pickedImage.map((image) => File(image.path)).toList();
    
    setState(() {
      _pickedImages.addAll(pickedImageFiles);
    });

    widget.onPickedImages(_pickedImages);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.image),
          label: Text(
            'Upload Image',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        if (_pickedImages.isNotEmpty)
          Column(
            children: _pickedImages.map((image) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.file(
                  image,
                  width: 150,
                  height: 150,
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
