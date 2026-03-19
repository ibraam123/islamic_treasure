import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_treasure/core/config/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 25,
                child: Icon(Icons.person, color: AppColors.primaryBlue),
              ), 
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'السلام عليكم، أحمد',
                    style: GoogleFonts.cairo(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkGreen,
                    ),
                  ),
                  Text(
                    'Welcome back to Oasis',
                    style: GoogleFonts.cairo(
                      fontSize: 14,
                      color: AppColors.mutedGreen,
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.translate, color: AppColors.primary),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.white,
              elevation: 2,
              shadowColor: Colors.black12,
            ),
          ),
        ],
      ),
    );
  }
}
