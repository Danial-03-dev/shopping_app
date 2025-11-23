import 'package:flutter/material.dart';

class ShoeSizeChip extends StatelessWidget {
  final VoidCallback? onTap;
  final int selectedSize;
  final int size;
  const ShoeSizeChip({
    super.key,
    this.onTap,
    required this.selectedSize,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final Color? chipColor = selectedSize == size
        ? Theme.of(context).colorScheme.primary
        : null;
    return GestureDetector(
      onTap: onTap,
      child: Chip(backgroundColor: chipColor, label: Text(size.toString())),
    );
  }
}
