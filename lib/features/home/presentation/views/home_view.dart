import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_treasure/core/config/app_colors.dart';
import 'package:islamic_treasure/features/home/presentation/widgets/daily_inspiration_card.dart';
import 'package:islamic_treasure/features/home/presentation/widgets/feature_card.dart';
import 'package:islamic_treasure/features/home/presentation/widgets/home_header.dart';
import 'package:islamic_treasure/features/home/presentation/widgets/prayer_times_card.dart';
import 'package:islamic_treasure/features/main/presentation/manager/main_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHeader(),
            const DailyInspirationCard(),
            const PrayerTimesCard(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'CONTINUE LEARNING',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mutedGreen.withValues(alpha: 0.5),
                      letterSpacing: 1.2,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: GoogleFonts.cairo(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.cardBorder),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.play_arrow, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Intro to Tafsir',
                          style: GoogleFonts.cairo(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkGreen,
                          ),
                        ),
                        Text(
                          'Lesson 4: Surah Al-Fatiha',
                          style: GoogleFonts.cairo(
                            fontSize: 13,
                            color: AppColors.mutedGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          value: 0.75,
                          strokeWidth: 4,
                          backgroundColor: AppColors.primaryBlue.withValues(alpha: 0.1),
                          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
                        ),
                      ),
                      Text(
                        '75%',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.5,
                children: [
                  FeatureCard(
                    title: 'Eduline',
                    icon: Icons.school_outlined,
                    bgColor: AppColors.edulineBg,
                    iconColor: AppColors.edulineIcon,
                    onTap: () {
                      context.read<MainCubit>().changeTab(MainTab.eduline); 
                    },
                  ),
                  FeatureCard(
                    title: 'Library',
                    icon: Icons.menu_book_outlined,
                    bgColor: AppColors.libraryBg,
                    iconColor: AppColors.libraryIcon,
                    onTap: () {},
                  ),
                  FeatureCard(
                    title: 'Qibla',
                    icon: Icons.explore_outlined,
                    bgColor: AppColors.qiblaBg,
                    iconColor: AppColors.qiblaIcon,
                    onTap: () {},
                  ),
                  FeatureCard(
                    title: 'Community',
                    icon: Icons.groups_outlined,
                    bgColor: AppColors.communityBg,
                    iconColor: AppColors.communityIcon,
                    onTap: () {
                      context.read<MainCubit>().changeTab(MainTab.community); 
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
