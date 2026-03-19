import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_treasure/core/config/app_colors.dart';
import 'package:islamic_treasure/core/config/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:islamic_treasure/core/constants/app_keys.dart';
import 'package:islamic_treasure/features/auth/presentation/manager/login_cubit.dart';
import 'package:islamic_treasure/features/auth/domain/entities/login_params.dart';
import 'package:islamic_treasure/features/auth/presentation/widgets/auth_button.dart';

import 'package:islamic_treasure/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:islamic_treasure/features/auth/presentation/widgets/user_type_switch.dart';


class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        const SizedBox(height: 48),
                        // App Logo/Title
                        Container(
                          height: 120,
                          width: 120,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.lightBackground,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.person, size: 60, color: AppColors.primaryBlue),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          AppKeys.signIn.tr(),
                          style: GoogleFonts.cairo(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkGreen,
                          ),
                        ),

                        Text(
                          AppKeys.welcomeBack.tr(),
                          style: GoogleFonts.cairo(
                            fontSize: 14,
                            color: AppColors.mutedGreen,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          AppKeys.chooseUserType.tr(),
                          style: GoogleFonts.cairo(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkGreen,
                          ),
                        ),
                        const SizedBox(height: 16),
                        BlocBuilder<LoginCubit, LoginState>(
                          buildWhen: (previous, current) => current is LoginUserTypeChanged,
                          builder: (context, state) {
                            return UserTypeSwitch( 
                              selectedType: context.read<LoginCubit>().selectedType,
                              onTypeChanged: (type) {
                                context.read<LoginCubit>().updateType(type);
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 48),

                        AuthTextField(
                          label: AppKeys.email.tr(),
                          hintText: AppKeys.emailHint.tr(),
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppKeys.emailRequired.tr();
                            }
                            if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                              return AppKeys.emailInvalid.tr();
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            return AuthTextField(
                              label: AppKeys.password.tr(),
                              hintText: AppKeys.passwordHint.tr(),
                              isPassword: true,
                              obscureText: context.read<LoginCubit>().isPasswordHidden,
                              controller: _passwordController,
                              onSuffixIconPressed: () {
                                context.read<LoginCubit>().togglePasswordVisibility();
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppKeys.passwordRequired.tr();
                                }
                                if (value.length < 6) {
                                  return AppKeys.passwordTooShort.tr();
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        const Spacer(), 
                        BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) {
                            if (state is LoginSuccess) {
                              // Navigate to main
                              context.go(AppRoutes.kMain);
                            } else if (state is LoginFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.message)),
                              );
                            }
                          },
                          builder: (context, state) {
                            return AuthButton(
                              text: 'تسجيل الدخول',
                              isLoading: state is LoginLoading,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<LoginCubit>().login(
                                        params: LoginParams(
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                        ),
                                      ); 
                                      GoRouter.of(context).go(AppRoutes.kMain);
                                }
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 48),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
