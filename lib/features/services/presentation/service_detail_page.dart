import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../bookings/logic/booking_provider.dart';
import '../data/models/service.dart';
import '../../../core/components/components.dart';
import '../../../core/design/design.dart';

class ServiceDetailPage extends StatelessWidget {
  final Service service;
  const ServiceDetailPage({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final bookingProvider = Provider.of<BookingProvider>(
      context,
      listen: false,
    );
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text(
          service.name,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: DesignPrinciples.fontWeightSemiBold,
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // TODO: Implement share functionality
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(DesignPrinciples.spacing6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Service Image
              if (service.imageUrl != null) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    DesignPrinciples.borderRadiusLg,
                  ),
                  child: Image.network(
                    service.imageUrl!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(
                            DesignPrinciples.borderRadiusLg,
                          ),
                        ),
                        child: Icon(
                          Icons.cleaning_services,
                          size: 64,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: DesignPrinciples.spacing6),
              ],

              // Service Category
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignPrinciples.spacing3,
                  vertical: DesignPrinciples.spacing1,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(
                    DesignPrinciples.borderRadiusFull,
                  ),
                ),
                child: Text(
                  service.category ?? 'Cleaning Service',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontWeight: DesignPrinciples.fontWeightMedium,
                  ),
                ),
              ),
              const SizedBox(height: DesignPrinciples.spacing4),

              // Service Description
              Text(
                service.description,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: DesignPrinciples.spacing8),

              // Service Details
              AppCard(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: theme.colorScheme.primary,
                          size: 24,
                        ),
                        const SizedBox(width: DesignPrinciples.spacing3),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Price',
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                              Text(
                                '\$${service.basePrice}',
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: DesignPrinciples.fontWeightBold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: DesignPrinciples.spacing4),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: theme.colorScheme.primary,
                          size: 24,
                        ),
                        const SizedBox(width: DesignPrinciples.spacing3),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Duration',
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                              Text(
                                '${service.durationMinutes} minutes',
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: DesignPrinciples.fontWeightMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),

              // Book Button
              AppButton(
                text: 'Book This Service',
                onPressed: () {
                  bookingProvider.setSelectedService(service);
                  Navigator.pushNamed(context, '/book');
                },
                icon: Icons.calendar_today,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
