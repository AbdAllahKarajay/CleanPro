import 'package:flutter/material.dart';
import '../../features/auth/presentation/login_page.dart';
import '../../features/auth/presentation/register_page.dart';
import '../../features/auth/presentation/profile_page.dart';
import '../../features/bookings/presentation/booking_list_page.dart';
import '../../features/services/presentation/service_list_page.dart';
import '../../features/bookings/presentation/booking_form_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => const LoginPage(),
  '/register': (context) => const RegisterPage(),
  '/profile': (context) => const ProfilePage(),
  '/services': (context) => const ServiceListPage(),
  '/bookings': (context) => const BookingListPage(),
  '/book': (context) => const BookingFormPage(),
};
