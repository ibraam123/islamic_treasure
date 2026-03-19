import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_treasure/core/config/app_colors.dart';
import 'package:islamic_treasure/features/main/presentation/manager/main_cubit.dart';
import 'package:islamic_treasure/features/main/presentation/views/tab_placeholder_view.dart';
import 'package:islamic_treasure/features/home/presentation/views/home_view.dart';
import 'package:islamic_treasure/features/courses/presentation/views/courses_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocBuilder<MainCubit, MainTab>(
        builder: (context, currentTab) {
          return Scaffold(
            appBar: currentTab == MainTab.home ? null : AppBar(
              title:  Text(currentTab == MainTab.courses ? "Explore Courses" : currentTab.name , style: GoogleFonts.cairo(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),),
              centerTitle: true,
              leading: currentTab == MainTab.courses ? const Icon(Icons.menu) : null,
              actions: currentTab == MainTab.courses ? [
               const Icon(Icons.notifications_outlined),
               const SizedBox(width: 16),
              ] : null,
              elevation: 0,
              backgroundColor: AppColors.background,
              foregroundColor: AppColors.black,
            ) ,
            body: IndexedStack(
              index: currentTab.index,
              children: const [
                HomeView(), // home
                CoursesView(), // courses
                PlaceholderView(title: 'Eduline Content'),
                PlaceholderView(title: 'Community Content'),
                PlaceholderView(title: 'Profile Content'),
              ],
            ),

            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .05),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                currentIndex: currentTab.index,
                onTap: (index) {
                  context.read<MainCubit>().changeTab(MainTab.values[index]);
                },
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.white,
                selectedItemColor: AppColors.navBarSelected,
                unselectedItemColor: AppColors.navBarUnselected,
                selectedFontSize: 12,
                unselectedFontSize: 12,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.book_outlined),
                    activeIcon: Icon(Icons.book),
                    label: 'Courses',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.play_circle_outline),
                    activeIcon: Icon(Icons.play_circle),
                    label: 'Eduline',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.people_outline),
                    activeIcon: Icon(Icons.people),
                    label: 'Community',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    activeIcon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
