import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {
  final String selectedStatus;
  final String selectedSync;
  final ValueChanged<String> onStatusChanged;
  final ValueChanged<String> onSyncChanged;

  const FilterBar({
    super.key,
    required this.selectedStatus,
    required this.selectedSync,
    required this.onStatusChanged,
    required this.onSyncChanged,
  });

  static const _statusFilters = [
    ('all', 'All'),
    ('draft', 'Draft'),
    ('submitted', 'Submitted'),
    ('approved', 'Approved'),
    ('rejected', 'Rejected'),
  ];

  static const _syncFilters = [
    ('all', 'All'),
    ('synced', 'Synced'),
    ('unsynced', 'Unsynced'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Status chips
        const Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _statusFilters.map((filter) {
              final isSelected = selectedStatus == filter.$1;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Text(filter.$2),
                  selected: isSelected,
                  onSelected: (_) => onStatusChanged(filter.$1),
                ),
              );
            }).toList(),
          ),
        ),

        const SizedBox(height: 12),

        // Sync chips
        const Text('Sync', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _syncFilters.map((filter) {
              final isSelected = selectedSync == filter.$1;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Text(filter.$2),
                  selected: isSelected,
                  onSelected: (_) => onSyncChanged(filter.$1),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
