import 'package:go_router/go_router.dart';
import 'package:islamic_treasure/features/auth/presentation/views/sign_in_view.dart';
import 'package:islamic_treasure/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:islamic_treasure/features/splash/presentation/views/splash_view.dart';

class AppRoutes {

  static const String kSplashView = '/';
  static const String kSignUpView = '/signUp';
  static const String kSignInView = '/signIn';
  static const String kForgetPasswordView = '/forgetPassword';
  static const String kOnboardingView = '/onboarding';
  static const String kAuth = '/auth';
  static const String kMain = '/main';

  static final GoRouter router = GoRouter(
    initialLocation: kSplashView,
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnboardingView,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: kSignInView,
        builder: (context, state) => const SignInView(),
      ),
    ],
  );
}

