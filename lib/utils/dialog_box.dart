import 'package:flutter/material.dart';
import 'package:todo/utils/custom_button.dart';

class DialogBox extends StatelessWidget {
  final String content;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final TextEditingController controller;

  const DialogBox(
      {super.key,
      required this.onSave,
      required this.onCancel,
      required this.controller,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      content: SizedBox(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: content,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(name: 'Save', onPressed: onSave),
                const SizedBox(width: 8),
                CustomButton(name: 'Cancel', onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
