import 'package:cleaning_services_app/features/bookings/logic/booking_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/models/booking.dart';
import '../../../core/components/components.dart';
import '../../../core/design/design.dart';

class BookingListPage extends StatefulWidget {
  const BookingListPage({super.key});

  @override
  State<BookingListPage> createState() => _BookingListPageState();
}

class _BookingListPageState extends State<BookingListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<BookingProvider>(context, listen: false).getBookings();
  }

  @override
  Widget build(BuildContext context) {
    final bookingProvider = Provider.of<BookingProvider>(context, listen: true);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text(
          'My Bookings',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: DesignPrinciples.fontWeightSemiBold,
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.filter_list),
          //   onPressed: () {
          //   },
          // ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 8,
        selectedIndex: 1,
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
          bookingProvider.isLoading
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(color: theme.colorScheme.primary),
                    const SizedBox(height: DesignPrinciples.spacing4),
                    Text(
                      'Loading bookings...',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              )
              : bookingProvider.bookings.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.book_outlined,
                      size: 64,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(height: DesignPrinciples.spacing4),
                    Text(
                      'No bookings yet',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: DesignPrinciples.spacing2),
                    Text(
                      'Book your first cleaning service',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: DesignPrinciples.spacing6),
                    AppButton(
                      text: 'Browse Services',
                      onPressed: () {
                        Navigator.pushNamed(context, '/services');
                      },
                      icon: Icons.cleaning_services,
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
                        'Your cleaning appointments',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    const SizedBox(height: DesignPrinciples.spacing4),
                    Expanded(
                      child: ListView.builder(
                        itemCount: bookingProvider.bookings.length,
                        itemBuilder: (context, index) {
                          final booking = bookingProvider.bookings[index];
                          return AppCardWithConfig.booking(
                            serviceName: booking.service.name,
                            date: booking.formattedDate,
                            time: booking.formattedTime,
                            status: booking.status,
                            address: booking.address,
                            price: booking.formattedPrice,
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
