import 'package:flutter/material.dart';
import '../../../data/model/category_model.dart';
class ExpenseLinesSection extends StatelessWidget {
  final String description;
  final String category;
  final double quantity;
  final double unitPrice;
  final double lineTotal;

  const ExpenseLinesSection({
    super.key,
    required this.description,
    required this.category,
    required this.quantity,
    required this.unitPrice,
    required this.lineTotal,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final contentColor = colorScheme.onPrimaryContainer;
    final categoryName = kDummyCategories.firstWhere(
      (cat) => cat['uuid'] == category,
      orElse: () => {'name': 'Unknown'},
    )['name'];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: description + category
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: textTheme.titleMedium?.copyWith(
                    color: contentColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  categoryName ?? 'Unknown',
                  style: textTheme.bodySmall?.copyWith(
                    color: contentColor.withAlpha((0.7 * 255).toInt()),
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),

          // Right: quantity, unit price, line total
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _infoRow(
                '×${quantity % 1 == 0 ? quantity.toInt() : quantity}',
                contentColor,
                textTheme,
              ),
              const SizedBox(height: 4),
              _infoRow(
                '\$${unitPrice.toStringAsFixed(2)} / unit',
                contentColor.withAlpha((0.7 * 255).toInt()),
                textTheme,
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withAlpha((0.15 * 255).toInt()),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '\$${lineTotal.toStringAsFixed(2)}',
                  style: textTheme.titleSmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String text, Color color, TextTheme textTheme) {
    return Text(text, style: textTheme.bodyMedium?.copyWith(color: color));
  }
}
