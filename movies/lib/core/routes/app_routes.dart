import 'package:flutter/material.dart';
import 'package:movies/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:movies/features/auth/presentation/screens/login_screen.dart';
import 'package:movies/features/auth/presentation/screens/register_screen.dart';
import 'package:movies/screens/home_screen.dart';
import 'package:movies/screens/onboarding_screens.dart';

abstract class AppRoutes {
  static const String initialRoute = OnboardingScreens.routeName;

  static Map<String, WidgetBuilder> routes = {
    OnboardingScreens.routeName: (context) => const OnboardingScreens(),
    LoginScreen.routeName: (context) => const LoginScreen(),
    RegisterScreen.routeName: (context) => const RegisterScreen(),
    ForgetPassword.routeName: (context) => const ForgetPassword(),
    HomeScreen.routeName: (context) => const HomeScreen(),
  };
}
