import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final Map<String, dynamic> itemData;
  final VoidCallback? onPressed;
  const CartItem({super.key, required this.itemData, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final title = itemData['title'].toString();
    final shoeSize = itemData['size'];
    final imageUrl = itemData['imageUrl'].toString();

    return ListTile(
      leading: CircleAvatar(radius: 32, backgroundImage: AssetImage(imageUrl)),
      title: Text(title, style: Theme.of(context).textTheme.bodySmall),
      subtitle: Text('Size: $shoeSize'),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(color: Colors.red, Icons.delete),
      ),
    );
  }
}
