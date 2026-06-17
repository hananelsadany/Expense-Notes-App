import 'package:flutter/material.dart';

class LocationSection extends StatelessWidget {
  final double latitude;
  final double longitude;
  final double accuracy;
  final DateTime acquisitionTimestamp;

  const LocationSection({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.accuracy,
    required this.acquisitionTimestamp,
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
              'Location',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Latitude: $latitude'),
            Text('Longitude: $longitude'),
            Text('Accuracy: ${accuracy.toStringAsFixed(2)} m'),
            Text('Captured at: ${acquisitionTimestamp.toLocal()}'),
          ],
        ),
      ),
    );
  }
}
