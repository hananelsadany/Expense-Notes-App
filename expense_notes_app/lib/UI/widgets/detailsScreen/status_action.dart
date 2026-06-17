import 'package:flutter/material.dart';

class StatusActions extends StatelessWidget {
  final String currentStatus;
  final void Function(String newStatus) onStatusChange;

  const StatusActions({
    super.key,
    required this.currentStatus,
    required this.onStatusChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          if (currentStatus == 'Draft')
            ElevatedButton(
              onPressed: () => onStatusChange('Submitted'),
              child: const Text('Submit'),
            ),
          if (currentStatus == 'Submitted') ...[
            ElevatedButton(
              onPressed: () => onStatusChange('Approved'),
              child: const Text('Approve'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () => onStatusChange('Rejected'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Reject'),
            ),
          ],
        ],
      ),
    );
  }
}
