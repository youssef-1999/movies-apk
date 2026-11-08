import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/common/app_colors.dart';
import 'package:movies/extensions/padding_extension.dart';
import 'package:movies/gen/assets.gen.dart';
import 'package:movies/services/auth_service.dart';
import 'package:movies/widgets/custom_elevated_button.dart';
import 'package:movies/widgets/custom_text_field.dart';
import 'package:movies/widgets/language_switch.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _languageCode = 'en';

  final _authService =
      AuthService(); // add as a field, import auth_service.dart
  bool _isLoading = false;

  Future<void> _loginWithGoogle() async {
    setState(() => _isLoading = true);
    try {
      final result = await _authService.signInWithGoogle();
      debugPrint('Google login result: ${result?.user?.email}, mounted=$mounted');
      if (result == null || !mounted) return; // cancelled
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logged in successfully!'),
          backgroundColor: AppColors.green,
        ),
      );
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } catch (e, st) {
      debugPrint('Google login error: $e\n$st');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Google sign-in failed: $e'),
          backgroundColor: AppColors.red,
        ),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _login() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      // keep your existing "Please fix the errors" SnackBar here
      return;
    }
    setState(() => _isLoading = true);
    try {
      await _authService.login(
        _emailController.text.trim(),
        _passwordController.text,
      );
      if (!mounted) return;
      // show your green success SnackBar, then navigate to home/login
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logged in successfully!'),
          backgroundColor: AppColors.green,
        ),
      );
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Login failed!',
            style: TextStyle(color: AppColors.white),
          ),
          backgroundColor: AppColors.red,
        ),
      );

      // show red SnackBar with e.message ?? 'Login failed'
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                Center(
                  child: Assets.splash.splashLogo.image(
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 69),
                CustomTextField(
                  hintText: 'Email',
                  controller: _emailController,
                  prefixIcon: Assets.icons.email,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ).paddingSymmetric(horizontal: 16),
                SizedBox(height: 23),
                CustomTextField(
                  hintText: 'Password',
                  controller: _passwordController,
                  prefixIcon: Assets.icons.password,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                ).paddingSymmetric(horizontal: 16),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forget-password');
                        // Handle forgot password logic
                      },
                      child: Text(
                        'Forgot Password?',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.yellow,
                        ),
                      ),
                    ).paddingOnly(top: 5),
                  ],
                ),
                CustomElevatedButton(
                  text: "Login",
                  onPressed: () {
                    // Handle login logic
                    _login();
                  },
                ).paddingOnly(left: 19, right: 19),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.yellow,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle sign up logic
                            Navigator.pushNamed(context, '/register');
                          },
                      ),
                    ],
                  ),
                ).paddingOnly(top: 16),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: AppColors.yellow,
                        thickness: 1,
                        indent: 50,
                        endIndent: 12,
                      ),
                    ),
                    Text(
                      'OR',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: AppColors.yellow),
                    ),
                    const Expanded(
                      child: Divider(
                        color: AppColors.yellow,
                        thickness: 1,
                        indent: 12,
                        endIndent: 50,
                      ),
                    ),
                  ],
                ).paddingOnly(top: 20),
                CustomElevatedButton(
                  text: 'Login With Google',
                  icon: SvgPicture.asset(
                    Assets.icons.google,
                    width: 24,
                    height: 24,
                  ),
                  onPressed: _isLoading ? null : _loginWithGoogle,
                ).paddingOnly(left: 19, right: 19, top: 20),

                LanguageSwitch(
                  languageCode: _languageCode,
                  onChanged: (code) {
                    setState(() => _languageCode = code);
                    // TODO: apply the locale app-wide once localization is set up
                  },
                ).paddingOnly(top: 24, bottom: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
