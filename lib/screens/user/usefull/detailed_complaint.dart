import 'package:flutter/material.dart';
import 'package:jct/language/helpers/app_localization_context_extenstion.dart';
import 'package:jct/models/complaint_item.dart';
import 'package:jct/theme/app_theme/app_theme.dart';

class DetailedPage extends StatelessWidget {
  final ComplaintItem complaintItem;

  const DetailedPage({
    required this.complaintItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.appColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: context.theme.appColors.onPrimary,
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(context.localizedString.detailed_complaint),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${context.localizedString.title}:',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: context.theme.appColors.secondary),
            ),
            Text(
              complaintItem.title,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${context.localizedString.description}:',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: context.theme.appColors.secondary),
            ),
            Text(
              complaintItem.description,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            //upload image here
            const SizedBox(height: 16),
            Text(
              '${context.localizedString.selected_category}:',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: context.theme.appColors.secondary),
            ),
            Text(
              complaintItem.selectedCategory,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${context.localizedString.urgency_level}:',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: context.theme.appColors.secondary),
            ),
            Text(
              complaintItem.selectedUrgency,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
