import 'package:flutter/material.dart';

popupSnackBar(String content, Color color, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
      backgroundColor: color,
      duration: const Duration(milliseconds: 800),
    ),
  );
}
