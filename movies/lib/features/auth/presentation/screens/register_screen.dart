import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/extensions/padding_extension.dart';
import 'package:movies/gen/assets.gen.dart';
import 'package:movies/features/auth/presentation/screens/login_screen.dart';
import 'package:movies/services/auth_service.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';
import 'package:movies/core/widgets/custom_text_field.dart';
import 'package:movies/core/widgets/language_switch.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _languageCode = 'en';

final _authService = AuthService();   // add as a field, import auth_service.dart
bool _isLoading = false;

Future<void> _register() async {
  if (!(_formKey.currentState?.validate() ?? false)) {
    // keep your existing "Please fix the errors" SnackBar here
    return;
  }
  setState(() => _isLoading = true);
  try {
    await _authService.register(
      _emailController.text.trim(),
      _passwordController.text,
    );
  await   FirebaseAuth.instance.currentUser?.updateDisplayName(_nameController.text.trim());
    if (!mounted) return;
    // show your green success SnackBar, then navigate to home/login
    // Firebase signs the new user in automatically; sign out so they log in manually.
    await _authService.logout();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Registered successfully! Please login.'),
        backgroundColor: AppColors.green,
      ),
    );
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginScreen.routeName,
      (route) => false,
    );
  } on FirebaseAuthException catch (e) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(e.message ?? 'Registration failed!'),
        backgroundColor: AppColors.red,
      ),
    );
  } catch (e) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(e.toString()),
        backgroundColor: AppColors.red,
      ),
    );
  } finally {
    if (mounted) setState(() => _isLoading = false);
  }
}


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmpasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.yellow),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Register',
            style: TextStyle(color: AppColors.yellow),
          ),
        ),
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
                SizedBox(height: 19),
                 CustomTextField(
                  hintText: 'Name',
                  controller: _nameController,
                  prefixIcon: Assets.icons.name,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Name';
                    }
                    return null;
                  },
                ).paddingSymmetric(horizontal: 16),
                SizedBox(height: 23),
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
                 SizedBox(height: 23),
                CustomTextField(
                  hintText: 'Confirm Password',
                  controller: _confirmpasswordController,
                  prefixIcon: Assets.icons.password,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty || value != _passwordController.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                ).paddingSymmetric(horizontal: 16),
                SizedBox(height: 23),
                CustomTextField(
                  hintText: 'Phone Number',
                  controller: _phoneController,
                  prefixIcon: Assets.icons.phone,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Phone Number';
                    }
                    // Egyptian mobile: 010 / 011 / 012 / 015 followed by 8 digits
                    if (!RegExp(r'^01[0125][0-9]{8}$').hasMatch(value.trim())) {
                      return 'Please enter a valid Egyptian phone number';
                    }
                    return null;
                  },
                ).paddingSymmetric(horizontal: 16),
                SizedBox(height: 23),
                
                CustomElevatedButton(
                  text:_isLoading ? 'Loading...' : "Create Account",
                  onPressed: _isLoading ? null : _register,

                ).paddingOnly(left: 19, right: 19),
                RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: AppColors.yellow),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          },
                      ),
                    ],
                  ),
                ).paddingOnly(top: 16),
               
               
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