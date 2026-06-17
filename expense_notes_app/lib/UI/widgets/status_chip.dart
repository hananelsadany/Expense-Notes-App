import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  final String status;
  const StatusChip({required this.status});

  Color _color() {
    switch (status.toLowerCase()) {
      case 'draft':
        return Colors.grey;
      case 'submitted':
        return Colors.blue;
      case 'approved':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _color().withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _color().withOpacity(0.4)),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: _color(),
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
