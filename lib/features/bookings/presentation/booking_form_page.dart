import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../logic/booking_provider.dart';
import '../../services/data/models/service.dart';
import '../../../core/components/components.dart';
import '../../../core/design/design.dart';

class BookingFormPage extends StatefulWidget {
  const BookingFormPage({super.key});

  @override
  State<BookingFormPage> createState() => _BookingFormPageState();
}

class _BookingFormPageState extends State<BookingFormPage> {
  final _formKey = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final addressController = TextEditingController();
  final instructionsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<BookingProvider>(context).selectedService;
    final bookingProvider = Provider.of<BookingProvider>(
      context,
      listen: false,
    );
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Book Service',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: DesignPrinciples.fontWeightSemiBold,
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
      ),
      body:
          service == null
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: theme.colorScheme.error,
                    ),
                    const SizedBox(height: DesignPrinciples.spacing4),
                    Text(
                      'No service selected',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: theme.colorScheme.error,
                      ),
                    ),
                    const SizedBox(height: DesignPrinciples.spacing2),
                    Text(
                      'Please select a service to book',
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
              : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(DesignPrinciples.spacing6),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        // Service Summary
                        AppCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.primaryContainer,
                                      borderRadius: BorderRadius.circular(
                                        DesignPrinciples.borderRadiusBase,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.cleaning_services,
                                      color: theme.colorScheme.onPrimaryContainer,
                                      size: 24,
                                    ),
                                  ),
                                  const SizedBox(width: DesignPrinciples.spacing3),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Selected Service',
                                          style: theme.textTheme.labelMedium
                                              ?.copyWith(
                                                color:
                                                    theme
                                                        .colorScheme
                                                        .onSurfaceVariant,
                                              ),
                                        ),
                                        Text(
                                          service!.name,
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                                fontWeight:
                                                    DesignPrinciples
                                                        .fontWeightSemiBold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '\$${service.basePrice}',
                                    style: theme.textTheme.titleLarge?.copyWith(
                                      color: theme.colorScheme.primary,
                                      fontWeight:
                                          DesignPrinciples.fontWeightBold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: DesignPrinciples.spacing3),
                              Text(
                                service.description,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: DesignPrinciples.spacing8),

                        // Booking Form
                        Text(
                          'Booking Details',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: DesignPrinciples.fontWeightSemiBold,
                          ),
                        ),
                        const SizedBox(height: DesignPrinciples.spacing6),

                        // Date Field
                        AppTextField(
                          controller: dateController,
                          label: 'Date',
                          hint: 'Select date',
                          isRequired: true,
                          readOnly: true,
                          onTap: () async {
                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(
                                const Duration(days: 365),
                              ),
                            );
                            if (pickedDate != null) {
                              dateController.text =
                                  pickedDate.toString().split(' ')[0];
                            }
                          },
                          validator:
                              (val) =>
                                  val == null || val.isEmpty
                                      ? "Date is required"
                                      : null,
                          prefixIcon: const Icon(Icons.calendar_today),
                        ),
                        const SizedBox(height: DesignPrinciples.spacing4),

                        // Time Field
                        AppTextField(
                          controller: timeController,
                          label: 'Time',
                          hint: 'Select time',
                          isRequired: true,
                          readOnly: true,
                          onTap: () async {
                            final TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (pickedTime != null) {
                              timeController.text =
                                  pickedTime.hour.toString().padLeft(2, '0') +
                                  ':' +
                                  pickedTime.minute.toString().padLeft(2, '0');
                            }
                          },
                          validator:
                              (val) =>
                                  val == null || val.isEmpty
                                      ? "Time is required"
                                      : null,
                          prefixIcon: const Icon(Icons.access_time),
                        ),
                        const SizedBox(height: DesignPrinciples.spacing4),

                        // Address Field
                        AppTextFieldWithConfig.address(
                          controller: addressController,
                          isRequired: true,
                          validator:
                              (val) =>
                                  val == null || val.isEmpty
                                      ? "Address is required"
                                      : null,
                        ),
                        const SizedBox(height: DesignPrinciples.spacing4),

                        // Instructions Field
                        AppTextField(
                          controller: instructionsController,
                          label: 'Special Instructions',
                          hint: 'Any special requirements or notes...',
                          isRequired: false,
                          maxLines: 3,
                          prefixIcon: const Icon(Icons.note),
                        ),
                        const SizedBox(height: DesignPrinciples.spacing8),

                        // Confirm Booking Button
                        AppButton(
                          text: 'Confirm Booking',
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final result = await bookingProvider
                                  .submitBooking(
                                    date: dateController.text,
                                    time: timeController.text,
                                    address: addressController.text,
                                    instructions: instructionsController.text,
                                  );
                              if (result != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text("Booking successful!"),
                                    backgroundColor:
                                        DesignPrinciples.successGreen,
                                  ),
                                );
                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text("Booking failed"),
                                    backgroundColor: DesignPrinciples.errorRed,
                                  ),
                                );
                              }
                            }
                          },
                          icon: Icons.check_circle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
    );
  }
}
