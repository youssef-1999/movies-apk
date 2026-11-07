import 'package:flutter/material.dart';
import 'package:movies/common/app_colors.dart';
import 'package:movies/extensions/padding_extension.dart';
import 'package:movies/gen/assets.gen.dart';
import 'package:movies/widgets/custom_elevated_button.dart';
import 'package:movies/widgets/custom_text_field.dart';

class ForgetPassword extends StatefulWidget {
  static const String routeName = '/forget-password';
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
void _reset_password() {
  // Implement your password reset logic here
  print('Reset password for email: ${_emailController.text}');
  // You can show a success message or navigate to another screen after resetting the password
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
            'Forget Password',
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
                  child: Assets.images.forgotPasswordBro1.image(
                    width: 380,
                    height: 380,
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
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                ).paddingSymmetric(horizontal: 16),
                SizedBox(height: 23),
                CustomElevatedButton(
                  text: "Reset Password",
                  onPressed: () {
                    // Handle registration logic
                    _reset_password();
                  },
                ).paddingOnly(left: 19, right: 19),
              ],
            ),
          ),
        ),
      )
    );
  }
}