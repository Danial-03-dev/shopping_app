import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/shoe_size_chip.dart';

class ShoeSizeList extends StatelessWidget {
  final List<int> sizes;
  final int selectedSize;
  final Function(int)? onSizeSelect;
  const ShoeSizeList({
    super.key,
    required this.sizes,
    required this.selectedSize,
    this.onSizeSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sizes.length,
        itemBuilder: (context, index) {
          final size = sizes[index];

          void handleSizeSelect() {
            if (onSizeSelect != null) onSizeSelect!(size);
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ShoeSizeChip(
              selectedSize: selectedSize,
              size: size,
              onTap: handleSizeSelect,
            ),
          );
        },
      ),
    );
  }
}
