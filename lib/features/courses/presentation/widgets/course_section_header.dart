import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_treasure/core/config/app_colors.dart';

class CourseSectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onViewAll;

  const CourseSectionHeader({
    super.key,
    required this.title,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.cairo(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.darkGreen,
            ),
          ),
          TextButton(
            onPressed: onViewAll,
            child: Text(
              'View All',
              style: GoogleFonts.cairo(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
