import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_treasure/core/config/app_colors.dart';

class CourseSearchField extends StatelessWidget {
  const CourseSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFEDF2F7).withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search courses, teachers...',
          hintStyle: GoogleFonts.cairo(
            color: AppColors.secondaryText,
            fontSize: 14,
          ),
          prefixIcon: const Icon(Icons.search, color: AppColors.secondaryText),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}
