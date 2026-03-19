import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_treasure/core/config/app_colors.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final VoidCallback onTap;

  const FeatureCard({
    super.key,
    required this.title,
    required this.icon,
    required this.bgColor,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
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
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 28),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: GoogleFonts.cairo(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.darkGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
