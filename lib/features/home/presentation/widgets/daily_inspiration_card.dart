import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_treasure/core/config/app_colors.dart';

class DailyInspirationCard extends StatelessWidget {
  const DailyInspirationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryBlue.withValues(alpha: 0.9),
            AppColors.primaryBlue,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'DAILY INSPIRATION',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white.withValues(alpha: 0.7),
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '"The best among you are those who learn the Quran and teach it"',
            textAlign: TextAlign.center,
            style: GoogleFonts.cairo(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '— Prophet Muhammad (PBUH)',
            style: GoogleFonts.cairo(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }
}
