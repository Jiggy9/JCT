class ComplaintItem {
  ComplaintItem({
    required this.id,
    required this.title,
    required this.description,
    required this.selectedCategory,
    required this.selectedUrgency,
  });

  final String id;
  final String title;
  final String description;
  final String selectedCategory;
  final String selectedUrgency;
}
