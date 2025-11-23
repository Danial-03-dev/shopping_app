import 'package:flutter/material.dart';

class CustomFilterChip extends StatelessWidget {
  final VoidCallback? onTap;
  final String label;
  final String selectedFilter;

  const CustomFilterChip({
    super.key,
    this.onTap,
    required this.label,
    required this.selectedFilter,
  });

  @override
  Widget build(BuildContext context) {
    final chipColor = selectedFilter == label
        ? Theme.of(context).colorScheme.primary
        : Color.fromRGBO(245, 247, 249, 1);

    return GestureDetector(
      onTap: onTap,
      child: Chip(
        label: Text(label),
        labelStyle: const TextStyle(fontSize: 20),
        backgroundColor: chipColor,
        side: BorderSide(color: chipColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      ),
    );
  }
}
