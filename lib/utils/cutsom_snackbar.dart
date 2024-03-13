import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

popupSnackBar(String content, Color color, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
      ),
      backgroundColor: color,
      duration: const Duration(milliseconds: 800),
    ),
  );
}
