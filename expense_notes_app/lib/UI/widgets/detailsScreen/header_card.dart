import 'package:flutter/material.dart';
import '../sync_chip.dart';

class HeaderCard extends StatelessWidget {
  final String UUID;
  final String title;
  final String status;
  const HeaderCard({
    super.key,
    required this.UUID,
    required this.title,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'UUID: $UUID',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 12),
            SyncChip(syncStatus: status),
          ],
        ),
      ),
    );
  }
}
