import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_treasure/core/config/app_colors.dart';
import 'package:islamic_treasure/features/auth/presentation/manager/login_cubit.dart';

class UserTypeSwitch extends StatelessWidget {
  final UserType selectedType;
  final Function(UserType) onTypeChanged;

  const UserTypeSwitch({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.lightBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ToggleButtons(
        isSelected: [
          selectedType == UserType.parent,
          selectedType == UserType.student,
        ],
        onPressed: (index) =>
            onTypeChanged(index == 0 ? UserType.parent : UserType.student),
        borderRadius: BorderRadius.circular(16),
        selectedColor: AppColors.primaryBlue,
        fillColor: Colors.white,
        color: AppColors.mutedGreen,
        renderBorder: false,
        splashColor: AppColors.primaryBlue.withValues(alpha: 0.06),
        constraints: const BoxConstraints(minHeight: 48),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Text(
              'ولي أمر',
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                fontSize: 16,
                fontWeight: selectedType == UserType.parent
                    ? FontWeight.bold
                    : FontWeight.w600,
                color: selectedType == UserType.parent
                    ? AppColors.primaryBlue
                    : AppColors.mutedGreen,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Text(
              'طالب',
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                fontSize: 16,
                fontWeight: selectedType == UserType.student
                    ? FontWeight.bold
                    : FontWeight.w600,
                color: selectedType == UserType.student
                    ? AppColors.primaryBlue
                    : AppColors.mutedGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
