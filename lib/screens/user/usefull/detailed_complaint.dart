import 'package:flutter/material.dart';
import 'package:jct/models/complaint_item.dart';

class DetailedPage extends StatelessWidget {
  final ComplaintItem complaintItem;

  const DetailedPage({
    required this.complaintItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaint Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildDetailCard(
                context,
                icon: Icons.title,
                label: 'Title',
                content: complaintItem.title,
              ),
              const SizedBox(height: 16),
              _buildDetailCard(
                context,
                icon: Icons.description,
                label: 'Description',
                content: complaintItem.description,
              ),
              const SizedBox(height: 16),
              _buildDetailCard(
                context,
                icon: Icons.category,
                label: 'Selected Category',
                content: complaintItem.selectedCategory,
              ),
              const SizedBox(height: 16),
              _buildDetailCard(
                context,
                icon: Icons.warning_amber_rounded,
                label: 'Urgency Level',
                content: complaintItem.selectedUrgency,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  // handle working on complaint
                },
                icon: const Icon(Icons.build_rounded),
                label: const Text("Mark as Working"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // handle complaint solved
                },
                icon: const Icon(Icons.check_circle_rounded),
                label: const Text("Mark as Solved"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCard(BuildContext context,
      {required IconData icon,
      required String label,
      required String content}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.blueAccent, size: 30),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    content,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
