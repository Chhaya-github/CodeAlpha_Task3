import 'package:fitness_app/presentation/pages/auth/user_details_screen.dart';
import 'package:fitness_app/presentation/pages/home/health_corner_screen.dart';
import 'package:fitness_app/presentation/pages/home/home.dart';
import 'package:fitness_app/presentation/pages/home/stroke_emergency_screen.dart';
import 'package:fitness_app/presentation/pages/onboarding/data/onboarding.dart';
import 'package:get/get.dart';
import '../presentation/pages/auth/sign_in_screen.dart';
import '../presentation/pages/auth/sign_up_screen.dart';
import '../presentation/pages/onboarding/onboading.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String onBoardingScreen = "/on_boarding_screen";
  static const String signUpScreen = "/sign_up_screen";
  static const String signInScreen = "/sign_in_screen";
  static const String userDetailsScreen = "/user_details_screen";
  static const String home = "/";
  static const String strokeEmergencyScreen = "/stroke_emergency_screen";
  static const String healthCornerScreen = "/health_corner_screen";

  static final List<GetPage> pages = [
    GetPage(
      name: home,
      page: () => const Home(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: onBoardingScreen,
      page: () => const OnBoardingScreen(),
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: signInScreen,
      page: () => SignInScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: userDetailsScreen,
      page: () => const UserDetailsScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: strokeEmergencyScreen,
      page: () => const StrokeEmergencyScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: healthCornerScreen,
      page: () => const HealthCornerScreen(),
      transition: Transition.cupertino,
    ),
  ];
}
