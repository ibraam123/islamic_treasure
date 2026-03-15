import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_treasure/core/config/app_colors.dart';
import 'package:islamic_treasure/features/onboarding/presentation/manager/onboarding_cubit.dart';
import 'package:islamic_treasure/features/onboarding/presentation/widgets/onboarding_body.dart';


class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: const Scaffold(
        backgroundColor: AppColors.background,
        body: OnboardingBody(),
      ),
    );
  }
}
