import 'package:flutter/material.dart';
import '../screens/ai_playground.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 900;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF054753),
            Color(0xFF228483),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(120),
        ),
      ),
      padding: EdgeInsets.only(
        top: isWide ? 170 : 100,
        bottom: isWide ? 160 : 100,
        left: 24,
        right: 24,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isWide
              ? Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: _buildTextContent(context, isWide),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 2,
                      child: _buildImage(isWide),
                    ),
                  ],
                )
              : Column(
                  children: [
                    _buildTextContent(context, isWide),
                    const SizedBox(height: 24),
                    _buildImage(isWide),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildTextContent(BuildContext context, bool isWide) {
    return Column(
      crossAxisAlignment:
          isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(
          'Smarter\nCardiac Diagnosis',
          textAlign: isWide ? TextAlign.left : TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.2,
              ),
        ),
        const SizedBox(height: 20),
        Text(
          'Meet LumenexHx — the first AI-powered auscultation and diagnostics platform in Egypt. Analyze heart sounds, medical images, and patient data with confidence and clarity.',
          textAlign: isWide ? TextAlign.left : TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white.withOpacity(0.9),
                height: 1.6,
              ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AIPlaygroundScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF054753),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          child: const Text('Try the Interactive Demo Now'),
        ),
      ],
    );
  }

  Widget _buildImage(bool isWide) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/doc.jpg',
        height: isWide ? 340 : 240,
        fit: BoxFit.cover,
      ),
    );
  }
}
