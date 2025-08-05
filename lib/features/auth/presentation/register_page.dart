import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../logic/auth_provider.dart';
import '../../../core/components/components.dart';
import '../../../core/design/design.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Create Account',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: DesignPrinciples.fontWeightSemiBold,
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(DesignPrinciples.spacing6),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: DesignPrinciples.spacing8),
                // Logo/Brand Section
                Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(
                          DesignPrinciples.borderRadiusLg,
                        ),
                      ),
                      child: const Icon(
                        Icons.person_add,
                        color: DesignPrinciples.neutralWhite,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: DesignPrinciples.spacing4),
                    Text(
                      'Join CleanPro',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: DesignPrinciples.fontWeightBold,
                      ),
                    ),
                    const SizedBox(height: DesignPrinciples.spacing2),
                    Text(
                      'Create your account to get started',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: DesignPrinciples.spacing12),
                // Registration Form
                AppTextFieldWithConfig.name(
                  controller: nameController,
                  isRequired: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    if (value.length < 2) {
                      return 'Name must be at least 2 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: DesignPrinciples.spacing4),
                AppTextFieldWithConfig.email(
                  controller: emailController,
                  isRequired: false,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Please enter a valid email address';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: DesignPrinciples.spacing4),
                AppTextFieldWithConfig.phone(
                  controller: phoneController,
                  isRequired: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (value.length < 10) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: DesignPrinciples.spacing4),
                AppTextFieldWithConfig.password(
                  controller: passwordController,
                  isRequired: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: DesignPrinciples.spacing6),
                // Register Button
                AppButton(
                  text: 'Create Account',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final success = await authProvider.register(
                        nameController.text,
                        phoneController.text,
                        emailController.text,
                        passwordController.text,
                      );
                      if (success) {
                        Navigator.pushReplacementNamed(context, '/services');
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            success
                                ? 'Registration successful'
                                : 'Registration failed',
                          ),
                          backgroundColor:
                              success
                                  ? DesignPrinciples.successGreen
                                  : DesignPrinciples.errorRed,
                        ),
                      );
                    }
                  },
                  isLoading: authProvider.isLoading,
                  icon: Icons.person_add,
                ),
                const SizedBox(height: DesignPrinciples.spacing8),
                // Additional Options
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          'Sign In',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: DesignPrinciples.fontWeightSemiBold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Footer
                Text(
                  'Join thousands of satisfied customers',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
