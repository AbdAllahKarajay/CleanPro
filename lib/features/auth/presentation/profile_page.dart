import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../logic/auth_provider.dart';
import '../../../core/components/components.dart';
import '../../../core/design/design.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: DesignPrinciples.fontWeightSemiBold,
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Navigate to settings
            },
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 8,
        selectedIndex: 2,
        onDestinationSelected: (int index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/services');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/bookings');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/profile');
          }
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.book), label: 'Bookings'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(DesignPrinciples.spacing6),
          children: [
            // Profile Header
            AppCard(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: theme.colorScheme.primaryContainer,
                    child: Text(
                      'U',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                        fontWeight: DesignPrinciples.fontWeightBold,
                      ),
                    ),
                  ),
                  const SizedBox(height: DesignPrinciples.spacing4),
                  Text(
                    'User',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: DesignPrinciples.fontWeightSemiBold,
                    ),
                  ),
                  const SizedBox(height: DesignPrinciples.spacing1),
                  Text(
                    'Welcome to CleanPro',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: DesignPrinciples.spacing8),

            // Profile Options
            AppCardWithConfig.info(
              title: 'Account Settings',
              content:
                  'Manage your account preferences and personal information',
              icon: Icons.person_outline,
              onTap: () {
                // TODO: Navigate to account settings
              },
            ),
            const SizedBox(height: DesignPrinciples.spacing4),
            AppCardWithConfig.info(
              title: 'Help & Support',
              content: 'Get help with your bookings and account',
              icon: Icons.help_outline,
              onTap: () {
                // TODO: Navigate to help and support
              },
            ),
            const SizedBox(height: DesignPrinciples.spacing4),
            AppCardWithConfig.info(
              title: 'About CleanPro',
              content: 'Learn more about our cleaning services',
              icon: Icons.info_outline,
              onTap: () {
                // TODO: Navigate to about page
              },
            ),
            const Spacer(),

            // Logout Button
            AppButton(
              text: 'Sign Out',
              onPressed: () async {
                await authProvider.logout();
                Navigator.pushReplacementNamed(context, '/login');
              },
              variant: AppButtonVariant.danger,
              icon: Icons.logout,
            ),
          ],
        ),
      ),
    );
  }
}
