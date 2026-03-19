import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_treasure/core/config/app_colors.dart';
import 'package:islamic_treasure/features/courses/presentation/widgets/course_search_field.dart';
import 'package:islamic_treasure/features/courses/presentation/widgets/course_section_header.dart';
import 'package:islamic_treasure/features/courses/presentation/widgets/enrolled_course_card.dart';
import 'package:islamic_treasure/features/courses/presentation/widgets/popular_course_card.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({super.key});

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  int selectedCategoryIndex = 0;
  final List<String> categories = ['All', 'Quranic Studies', 'Prophetic Seerah', 'Hadith'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CourseSearchField(),

          // Categories
          SizedBox(
            height: 44,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final isSelected = selectedCategoryIndex == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: InkWell(
                    onTap: () => setState(() => selectedCategoryIndex = index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primaryBlue : AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelected ? AppColors.primaryBlue : AppColors.cardBorder,
                        ),
                        boxShadow: isSelected ? [
                          BoxShadow(
                            color: AppColors.primaryBlue.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ] : null,
                      ),
                      child: Text(
                        categories[index],
                        style: GoogleFonts.cairo(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : AppColors.secondaryText,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          CourseSectionHeader(
            title: 'My Enrolled Courses',
            onViewAll: () {},
          ),

          SizedBox(
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(right: 20),
              children: const [
                EnrolledCourseCard(
                  title: 'Comprehensive Prophetic Seerah',
                  imagePath: 'https://images.unsplash.com/photo-1542810634-71277d95dcbb?q=80&w=600&h=400&auto=format&fit=crop',
                  progress: 65,
                  duration: '12 Hours',
                  lessons: 24,
                ),
                EnrolledCourseCard(
                  title: 'Principles of Fiqh',
                  imagePath: 'https://images.unsplash.com/photo-1542810634-71277d95dcbb?q=80&w=600&h=400&auto=format&fit=crop',
                  progress: 30,
                  duration: '8 Hours',
                  lessons: 15,
                ),
              ],
            ),
          ),

          CourseSectionHeader(
            title: 'Popular Courses',
            onViewAll: () {},
          ),

          const PopularCourseCard(
            title: 'Tafsir of Rulings Verses',
            teacher: 'Dr. Abdullah Mansour',
            imagePath: 'https://images.unsplash.com/photo-1609599006353-e629aaabfeae?q=80&w=150&h=150&auto=format&fit=crop',
            duration: '15 Hours',
            price: 'Free',
            priceColor: AppColors.primaryBlue,
          ),

          const PopularCourseCard(
            title: 'History of Lost Andalusia',
            teacher: 'Prof. Tariq Al-Suwaidan',
            imagePath: 'https://images.unsplash.com/photo-1609599006353-e629aaabfeae?q=80&w=150&h=150&auto=format&fit=crop',
            duration: '20 Hours',
            price: '150 AED',
            priceColor: AppColors.primaryBlue,
          ),


          const SizedBox(height: 100), // Space for bottom nav
        ],
      ),
    );
  }
}
