import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bottom_nav.dart';
import 'package:quiz_app/src/bloc/auth_bloc/auth_bloc.dart';
import 'package:quiz_app/src/constants/colors.dart';
import 'package:quiz_app/src/utils/rourtes.dart';
import 'package:quiz_app/src/utils/validators.dart';
import 'package:quiz_app/src/widgets/custom_snackbar.dart';
import 'package:quiz_app/src/widgets/custom_text_field.dart';
import 'package:quiz_app/src/widgets/primary_button.dart';
import 'package:quiz_app/src/widgets/secondary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final _obscurePassword = ValueNotifier(true);

  bool _hasShownLoginSuccess = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: BlocListener<AuthBloc, AuthState>(
 listenWhen: (previous, current) =>
      previous.isAuthenticated != current.isAuthenticated ||
      previous.errorMessage != current.errorMessage,
  listener: (context, state) {
    if (state.isAuthenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainScreen()),
      );
    }

    if (state.errorMessage != null) {
      CustomSnackbar.show(
        context,
        message: state.errorMessage!,
        backgroundColor: AppColors.error,
      );
    }
  },
     child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: emailController,
                  label: "Email",
                  icon: Icons.email,
                  focusNode: emailFocus,
                  validator: TValidator.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(passwordFocus),
                ),
                const SizedBox(height: 16),
                ValueListenableBuilder(
                  valueListenable: _obscurePassword,
                  builder: (context, isObscured, _) {
                    return CustomTextField(
                      controller: passwordController,
                      label: "Password",
                      icon: Icons.lock,
                      focusNode: passwordFocus,
                      validator: TValidator.validatePassword,
                      obscureText: isObscured,
                      onToggleObscure: () =>
                          _obscurePassword.value = !isObscured,
                    );
                  },
                ),
                const SizedBox(height: 40),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return PrimaryButton(
                      text: "Login",
                      isLoading: state.isLoading,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          _hasShownLoginSuccess = false; // reset for new login

                          context.read<AuthBloc>().add(
                            AuthEvent.login(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                SecondaryButton(
                  
  text: "Create Account",
  onPressed: () {
    Navigator.pushNamed(context, AppRoutes.signup);
  },
),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
