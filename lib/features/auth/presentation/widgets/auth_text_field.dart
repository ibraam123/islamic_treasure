import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_treasure/core/config/app_colors.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? onSuffixIconPressed;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.isPassword = false,
    this.obscureText = false,
    this.onSuffixIconPressed,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.cairo(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.darkGreen,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          cursorColor: AppColors.primaryBlue,
          style: GoogleFonts.cairo(fontSize: 16),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.cairo(color: AppColors.darkGrey, fontSize: 14),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: AppColors.darkGrey,
                      size: 20,
                    ),
                    onPressed: onSuffixIconPressed,
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.softGrey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primaryBlue),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
          ),
        ),
      ],
    );
  }
}
