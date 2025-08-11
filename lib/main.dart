import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/landing_page.dart';

void main() {
  runApp(const LumenexHxWebApp());
}

class LumenexHxWebApp extends StatelessWidget {
  const LumenexHxWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LumenexHx Platform',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF0F6F4),
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF054753),
          primary: const Color(0xFF054753),
          secondary: const Color(0xFF2D9E98),
        ),
        useMaterial3: true,
      ),
      home: const LandingPage(),
    );
  }
}
