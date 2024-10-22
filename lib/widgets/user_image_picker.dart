import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jct/language/helpers/app_localization_context_extenstion.dart';
import 'package:jct/theme/app_theme/app_theme.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({
    super.key,
    required this.onPickedImage,
  });

  final void Function(File pickedImage) onPickedImage;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImageFile;

  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 150);
    if (pickedImage == null) return;
    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });
    widget.onPickedImage(_pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.theme.appColors;
    return Column(
      children: [
        CircleAvatar(
            radius: 40,
            backgroundColor: appTheme.surface,
            foregroundImage:
                _pickedImageFile != null ? FileImage(_pickedImageFile!) : null),
        TextButton.icon(
          onPressed: _pickImage,
          icon: Icon(
            Icons.image,
            color: appTheme.onSurface,
          ),
          label: Text(
            context.localizedString.add_image,
            style: TextStyle(
              color: appTheme.onBackground,
            ),
          ),
        ),
      ],
    );
  }
}
