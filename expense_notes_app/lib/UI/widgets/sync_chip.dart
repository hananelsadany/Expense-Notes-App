import 'package:flutter/material.dart';

class SyncChip extends StatelessWidget {
  final String syncStatus;
  const SyncChip({required this.syncStatus});

  @override
  Widget build(BuildContext context) {
    final isSynced = syncStatus.toLowerCase() == 'synced';
    return Row(
      children: [
        Icon(
          isSynced ? Icons.cloud_done : Icons.cloud_off,
          size: 14,
          color: isSynced ? Colors.green : Colors.orange,
        ),
        const SizedBox(width: 4),
        Text(
          isSynced ? 'Synced' : 'Unsynced',
          style: TextStyle(
            fontSize: 12,
            color: isSynced ? Colors.green : Colors.orange,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
