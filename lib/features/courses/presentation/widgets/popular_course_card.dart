import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_treasure/core/config/app_colors.dart';

class PopularCourseCard extends StatelessWidget {
  final String title;
  final String teacher;
  final String imagePath;
  final String duration;
  final String price;
  final Color priceColor;

  const PopularCourseCard({
    super.key,
    required this.title,
    required this.teacher,
    required this.imagePath,
    required this.duration,
    required this.price,
    this.priceColor = AppColors.primaryBlue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.cairo(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkGreen,
                  ),
                ),
                Text(
                  teacher,
                  style: GoogleFonts.cairo(
                    fontSize: 13,
                    color: AppColors.secondaryText,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 14, color: AppColors.secondaryText),
                        const SizedBox(width: 4),
                        Text(
                          duration,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppColors.secondaryText,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      price,
                      style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: priceColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
