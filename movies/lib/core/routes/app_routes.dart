import 'package:flutter/material.dart';
import 'package:movies/screens/auth/forget_password.dart';
import 'package:movies/screens/auth/login_screen.dart';
import 'package:movies/screens/auth/register_screen.dart';
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
