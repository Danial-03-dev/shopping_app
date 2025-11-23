import 'package:flutter/material.dart';

class DeleteDialogue extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onAccept;

  const DeleteDialogue({
    super.key,
    required this.title,
    required this.description,
    this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    void handleReject() {
      Navigator.of(context).pop();
    }

    return AlertDialog(
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      content: Text(description),
      actions: [
        TextButton(
          onPressed: onAccept,
          child: const Text("Yes", style: TextStyle(color: Colors.red)),
        ),
        TextButton(
          onPressed: handleReject,
          child: const Text("No", style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}
