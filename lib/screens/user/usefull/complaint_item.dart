import 'dart:io';

class ComplaintItem {
  ComplaintItem({
    required this.id,
    required this.selectedCategory,
    required this.selectedImages,
    required this.title,
    required this.description,
  });

  final String id;
  final String title;
  final String description;
  final String selectedCategory;
  final List<File> selectedImages;
}
