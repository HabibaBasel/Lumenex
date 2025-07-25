import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:luminixdx_web_ui_en/core/utils/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 80),
          width: double.infinity,
          color: AppColors.background,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "LumenexHx Health: AI-Powered Cardiac Diagnosis",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 20),
              Text(
                "Egypt’s first AI-powered diagnostic platform for heart sounds, medical images, and clinical data.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // TODO: Navigate to AI Playground
                },
                child: const Text("Try the Interactive Demo"),
              ),
              const SizedBox(height: 80),
              Text(
                "The Problem",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                "In Egypt, late diagnosis of heart conditions contributes to preventable deaths. Many patients are undiagnosed until it's too late, due to lack of tools and awareness.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 80),
              Text(
                "Our Solution",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                "LumenexHx offers an integrated diagnostic ecosystem:\n"
                "- Stetho™ Pro: Smart auscultation headset\n"
                "- Lumen™ AI: Heart sound, image, and data analysis\n"
                "- Lumen™ Home: Future patient-side monitoring",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 80),
              Text(
                "Target Audience",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 32,
                runSpacing: 32,
                children: [
                  _audienceTile(Icons.local_hospital, "Emergency Doctors"),
                  _audienceTile(Icons.favorite, "Cardiologists"),
                  _audienceTile(Icons.school, "Medical Universities"),
                  _audienceTile(
                      FontAwesomeIcons.stethoscope, "Internal Medicine"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _audienceTile(IconData icon, String title) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      CircleAvatar(
        radius: 30,
        backgroundColor: AppColors.secondary,
        child: Icon(icon, size: 30, color: Colors.white),
      ),
      const SizedBox(height: 8),
      Text(title, style: const TextStyle(fontSize: 16)),
    ],
  );
}
