import 'dart:io';
import 'package:flutter/material.dart';

class ReceiptsSection extends StatelessWidget {
  final List<String> receiptPaths; // local file paths

  const ReceiptsSection({super.key, required this.receiptPaths});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: receiptPaths.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (_) => Dialog(
                child: InteractiveViewer(
                  child: Image.file(File(receiptPaths[index])),
                ),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                File(receiptPaths[index]),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
