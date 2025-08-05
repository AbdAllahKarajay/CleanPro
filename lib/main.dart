import 'package:cleaning_services_app/core/remote_datasource/remote_datasource.dart';
import 'package:cleaning_services_app/features/auth/logic/auth_provider.dart';
import 'package:cleaning_services_app/features/bookings/logic/booking_provider.dart';
import 'package:cleaning_services_app/features/services/logic/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'features/auth/presentation/login_page.dart';
import 'core/routes/app_routes.dart';
import 'core/design/app_theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  RemoteDatasource.instance.init(
    onInvalidToken: () {},
    loginGetter: () {
      return AuthProvider.authenticated;
    },
    tokenGetter: () {
      return AuthProvider.token!;
    },
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => BookingProvider()),
        ChangeNotifierProvider(create: (context) => ServiceProvider()),
      ],
      child: MaterialApp(
        title: 'CleanPro - Professional Cleaning Services',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routes: appRoutes,
        home: const LoginPage(),
      ),
    );
  }
}
