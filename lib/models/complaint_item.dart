import 'package:equatable/equatable.dart';

class ComplaintItem extends Equatable {
  final String id;
  final String title;
  final String description;
  final String selectedCategory;
  final String selectedUrgency;

  ComplaintItem({
    required this.id,
    required this.title,
    required this.description,
    required this.selectedCategory,
    required this.selectedUrgency,
  });

  @override
  List<Object?> get props => [id, title, description, selectedCategory, selectedUrgency];

  // Factory method to create a ComplaintItem from a JSON object
  factory ComplaintItem.fromJson(Map<String, dynamic> json) {
    return ComplaintItem(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      selectedCategory: json['selectedCategory'],
      selectedUrgency: json['selectedUrgency'],
    );
  }

  // Method to convert a ComplaintItem to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'selectedCategory': selectedCategory,
      'selectedUrgency': selectedUrgency,
    };
  }
}
