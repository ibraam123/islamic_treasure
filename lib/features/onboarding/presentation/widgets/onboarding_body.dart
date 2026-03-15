import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_treasure/core/config/app_assets.dart';
import 'package:islamic_treasure/core/config/app_colors.dart';
import 'package:islamic_treasure/core/config/app_routes.dart';
import 'package:islamic_treasure/core/services/cache_service.dart';
import 'package:islamic_treasure/features/onboarding/domain/entities/onboarding_model.dart';
import 'package:islamic_treasure/features/onboarding/presentation/manager/onboarding_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:islamic_treasure/core/constants/app_keys.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  final PageController _pageController = PageController();

  final List<OnboardingModel> _pages = [
    OnboardingModel(
      image: AppAssets.onboarding1,
      title: AppKeys.onboardingTitle1.tr(),
      description: AppKeys.onboardingDesc1.tr(),
    ),
    OnboardingModel(
      image: AppAssets.onboarding2,
      title: AppKeys.onboardingTitle2.tr(),
      description: AppKeys.onboardingDesc2.tr(),
    ),
    OnboardingModel(
      image: AppAssets.onboarding3,
      title: AppKeys.onboardingTitle3.tr(),
      description: AppKeys.onboardingDesc3.tr(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                context.read<OnboardingCubit>().updatePage(index);
              },
              itemBuilder: (context, index) {
                return OnboardingItem(model: _pages[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                int currentPage = context.read<OnboardingCubit>().currentPage;
                bool isLastPage = currentPage == _pages.length - 1;

                return Column(
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: _pages.length,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: AppColors.primaryBlue,
                        dotColor: AppColors.softGrey,
                        dotHeight: 8,
                        dotWidth: 8,
                        expansionFactor: 4,
                        spacing: 8,
                      ),
                    ),
                    const SizedBox(height: 48),
                    ElevatedButton(
                      onPressed: () {
                        if (isLastPage) {
                          _finishOnboarding(context);
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isLastPage ? AppKeys.startNow.tr() : AppKeys.next.tr(),
                            style: GoogleFonts.cairo(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),

                          if (isLastPage)
                            const SizedBox()
                          else
                            const Icon(Icons.arrow_forward, size: 20),

                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (!isLastPage)
                      TextButton(
                        onPressed: () => _finishOnboarding(context),
                        child: Text(
                          AppKeys.skip.tr(),
                          style: GoogleFonts.cairo(
                            color: AppColors.mutedGreen,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    else
                      const SizedBox(height: 48),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _finishOnboarding(BuildContext context) async {
    await CacheService.setData(key: 'onboarding_seen', value: true);
    if (context.mounted) {
      context.go(AppRoutes.kSignInView);
    }
  }
}

class OnboardingItem extends StatelessWidget {
  final OnboardingModel model;
  const OnboardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              color: AppColors.lightBackground,
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.all(24),
            child: Image.asset(
              model.image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 48),
          Text(
            model.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.cairo(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.darkGreen,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            model.description,
            textAlign: TextAlign.center,
            style: GoogleFonts.cairo(
              fontSize: 16,
              color: AppColors.mutedGreen,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
