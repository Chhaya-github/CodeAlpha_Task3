import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:healthify/core/app_exports.dart';
import 'package:healthify/core/constants/enums.dart';
import 'package:healthify/helper/local_string.dart';
import 'package:healthify/presentation/pages/auth/sign_in_screen.dart';
import 'package:healthify/presentation/pages/home/home.dart';
import 'package:healthify/presentation/pages/onboarding/onboading.dart';
import 'package:healthify/repository/auth_repo/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './routes/app_routes.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
        (_) {
      runApp(
        const MyApp(),
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<Widget> _getInitialScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isAuthenticated =
        prefs.getBool(AuthState.authenticated.toString()) ?? false;

    if (isAuthenticated) {
      return const Home();
    } else {
      final bool isNewUser =
          prefs.getBool(AuthState.unknown.toString()) ?? true;

      if (isNewUser) {
        return const OnBoardingScreen();
      } else {
        return SignInScreen();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuTheme(
      data: PopupMenuThemeData(
        textStyle: TextStyle(
          color: ColorConstant.bluedark,
        ),
        color: ColorConstant.whiteBackground,
      ),
      child: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          locale: Get.deviceLocale,
          translations: LocalString(),
          title: 'Fitness Tracker',
          theme: ThemeData(
            primaryColor: Colors.white,
          ),
          initialRoute: "/",
          getPages: [
            GetPage(
              name: "/",
              page: () => FutureBuilder<Widget>(
                  future: _getInitialScreen(),
                  builder:
                      (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!;
                    } else {
                      // For showing splash screen during loading
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            AppRoutes.homePage,
            AppRoutes.onBoardingPage,
            AppRoutes.signInPage,
            AppRoutes.signUpPage,
            AppRoutes.userDetailsPage,
            AppRoutes.stokeEmergencyPage,
            AppRoutes.healthCornerPage,
          ],
        ),
      ),
    );
  }
}
