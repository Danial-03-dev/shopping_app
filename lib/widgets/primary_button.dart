import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Size? minimumSize;
  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.minimumSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        minimumSize: minimumSize,
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: Colors.black, fontSize: 18)),
    );
  }
}
