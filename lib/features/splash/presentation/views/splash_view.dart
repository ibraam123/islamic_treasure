import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_treasure/core/config/app_colors.dart';
import 'package:islamic_treasure/core/config/app_routes.dart';

import '../../../../core/services/cache_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  void _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    bool onboardingSeen  = await CacheService.getBool(key: 'onboarding_seen');

    if (onboardingSeen) {
      context.go(AppRoutes.kMain);
    } else {
      context.go(AppRoutes.kOnboardingView);
    }

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.auto_awesome,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 24),
            Text(
              'Islamic Treasure',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
