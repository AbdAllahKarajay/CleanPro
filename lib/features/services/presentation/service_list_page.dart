import 'package:cleaning_services_app/features/services/presentation/service_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../logic/service_provider.dart';
import '../../../core/components/components.dart';
import '../../../core/design/design.dart';

class ServiceListPage extends StatefulWidget {
  const ServiceListPage({super.key});

  @override
  State<ServiceListPage> createState() => _ServiceListPageState();
}

class _ServiceListPageState extends State<ServiceListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ServiceProvider>(context, listen: false).fetchServices();
  }

  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Our Services',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: DesignPrinciples.fontWeightSemiBold,
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 8,
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
      body:
          serviceProvider.isLoading
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(color: theme.colorScheme.primary),
                    const SizedBox(height: DesignPrinciples.spacing4),
                    Text(
                      'Loading services...',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              )
              : serviceProvider.services.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cleaning_services_outlined,
                      size: 64,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(height: DesignPrinciples.spacing4),
                    Text(
                      'No services available',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: DesignPrinciples.spacing2),
                    Text(
                      'Please check back later',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              )
              : Padding(
                padding: const EdgeInsets.all(DesignPrinciples.spacing4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: DesignPrinciples.spacing4,
                        vertical: DesignPrinciples.spacing2,
                      ),
                      child: Text(
                        'Choose from our professional cleaning services',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    const SizedBox(height: DesignPrinciples.spacing4),
                    Expanded(
                      child: ListView.builder(
                        itemCount: serviceProvider.services.length,
                        itemBuilder: (context, index) {
                          final service = serviceProvider.services[index];
                          return AppCardWithConfig.service(
                            title: service['name'] ?? 'Service',
                            description:
                                service['description'] ??
                                'Professional cleaning service',
                            price: '\$${service['base_price']}',
                            duration: '${service['duration_minutes']} min',
                            imageUrl: service['image_url'],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          ServiceDetailPage(service: service),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
