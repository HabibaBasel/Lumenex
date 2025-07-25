import 'package:flutter/material.dart';
import 'package:luminixdx_web_ui_en/core/utils/theme.dart';
import 'package:luminixdx_web_ui_en/presentation/screens/homepage.dart';

void main() {
  runApp(const LumenexHxApp());
}

class LumenexHxApp extends StatelessWidget {
  const LumenexHxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LumenexHx Health Platform',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        // '/playground': (context) => const PlaygroundPage(), // to be added later
      },
    );
  }
}
