import 'package:flutter/material.dart';
import 'package:movies/common/app_theme.dart';
import 'package:movies/screens/auth/forget_password.dart';
import 'package:movies/screens/auth/login_screen.dart';
import 'package:movies/screens/auth/register_screen.dart';
import 'package:movies/screens/onboarding_screens.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      initialRoute: OnboardingScreens.routeName,
      routes: {
        OnboardingScreens.routeName: (context) => const OnboardingScreens(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        ForgetPassword.routeName: (context) => const ForgetPassword(),
      },
    );
  }
}
