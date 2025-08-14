import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bottom_nav.dart';
import 'package:quiz_app/src/bloc/auth_bloc/auth_bloc.dart';
import 'package:quiz_app/src/constants/colors.dart';
import 'package:quiz_app/src/utils/validators.dart';
import 'package:quiz_app/src/widgets/custom_snackbar.dart';
import 'package:quiz_app/src/widgets/custom_text_field.dart';
import 'package:quiz_app/src/widgets/primary_button.dart';
import 'package:quiz_app/src/widgets/secondary_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final firstNameFocus = FocusNode();
  final lastNameFocus = FocusNode();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();

  final _obscurePassword = ValueNotifier(true);
  final _obscureConfirmPassword = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: BlocListener<AuthBloc, AuthState>(
       listener: (context, state) {
  if (state.isAuthenticated) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MainScreen()),
    );
  } else if (state.errorMessage != null) {
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
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: firstNameController,
                        label: "First Name",
                        icon: Icons.person_outline,
                        validator: TValidator.validateName,
                        focusNode: firstNameFocus,
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(lastNameFocus),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomTextField(
                        controller: lastNameController,
                        label: "Last Name",
                        icon: Icons.person_outline,
                        validator: TValidator.validateName,
                        focusNode: lastNameFocus,
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(emailFocus),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: emailController,
                  label: "Email",
                  icon: Icons.email,
                  validator: TValidator.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: emailFocus,
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
                      validator: TValidator.validatePassword,
                      focusNode: passwordFocus,
                      obscureText: isObscured,
                      onToggleObscure: () =>
                          _obscurePassword.value = !isObscured,
                      onFieldSubmitted: (_) => FocusScope.of(
                        context,
                      ).requestFocus(confirmPasswordFocus),
                    );
                  },
                ),
                const SizedBox(height: 16),
                ValueListenableBuilder(
                  valueListenable: _obscureConfirmPassword,
                  builder: (context, isObscured, _) {
                    return CustomTextField(
                      controller: confirmPasswordController,
                      label: "Confirm Password",
                      icon: Icons.lock_outline,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirm Password is required';
                        }
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      focusNode: confirmPasswordFocus,
                      obscureText: isObscured,
                      onToggleObscure: () =>
                          _obscureConfirmPassword.value = !isObscured,
                    );
                  },
                ),
                const SizedBox(height: 40),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return PrimaryButton(
                      text: "Sign Up",
                      isLoading: state.isLoading,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                            AuthEvent.signup(
                              firstName: firstNameController.text.trim(),
                              lastName: lastNameController.text.trim(),
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
                  text: "Already have an account? Login",
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
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
