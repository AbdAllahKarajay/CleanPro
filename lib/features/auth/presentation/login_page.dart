import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/presentation/service_list_page.dart';
import '../logic/auth_provider.dart';
import '../../../core/components/app_button.dart';
import '../../../core/components/app_text_field.dart';
import '../../../core/design/design_principles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
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
          'Welcome Back',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: DesignPrinciples.fontWeightSemiBold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(DesignPrinciples.spacing6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            Icons.cleaning_services,
                            color: DesignPrinciples.neutralWhite,
                            size: 40,
                          ),
                        ),
                        const SizedBox(height: DesignPrinciples.spacing4),
                        Text(
                          DesignPrinciples.brandName,
                          style: theme.textTheme.headlineLarge?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: DesignPrinciples.fontWeightBold,
                          ),
                        ),
                        const SizedBox(height: DesignPrinciples.spacing2),
                        Text(
                          DesignPrinciples.brandTagline,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),

                    const SizedBox(height: DesignPrinciples.spacing12),

                    // Login Form
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

                    // Login Button
                    AppButton(
                      text: 'Sign In',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final success = await authProvider.login(
                            phoneController.text,
                            passwordController.text,
                          );
                          if (success) {
                            Navigator.pushReplacementNamed(
                              context,
                              '/services',
                            );
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                success ? 'Login successful' : 'Login failed',
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
                      icon: Icons.login,
                    ),

                    const SizedBox(height: DesignPrinciples.spacing8),

                    // Additional Options
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: Text(
                              'Sign Up',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: DesignPrinciples.fontWeightSemiBold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: DesignPrinciples.spacing8),

                    // Footer
                    Text(
                      'Professional cleaning services at your fingertips',
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
        ),
      ),
    );
  }
}
