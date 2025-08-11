import 'package:flutter/material.dart';
import 'section_wrapper.dart';

class ProblemSection extends StatelessWidget {
  const ProblemSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      backgroundColor: const Color(0xFFF0F6F4),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 900;

          Widget textContent = Column(
            crossAxisAlignment:
                isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Text(
                'The Diagnostic Gap',
                textAlign: isWide ? TextAlign.left : TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF054753),
                      letterSpacing: 1.2,
                    ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 75,
                height: 4,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF054753),
                      Color(0xFF2D9E98),
                      Color(0xFFF0F6F4)
                    ],
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'In Egypt and similar healthcare systems, early diagnosis of cardiac conditions is often missed — not because of negligence, but due to the lack of accessible, intelligent diagnostic tools.\n\n'
                'Traditional auscultation is limited, and visual/audio interpretation varies from doctor to doctor. This leads to misdiagnosis, delayed treatment, and avoidable complications.',
                textAlign: isWide ? TextAlign.left : TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black87,
                      height: 1.8,
                    ),
              ),
            ],
          );

          Widget imageContent = Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/patient.jpg',
                height: isWide ? 320 : 260,
                fit: BoxFit.cover,
              ),
            ),
          );

          return isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 2, child: imageContent),
                    const SizedBox(width: 50),
                    Expanded(flex: 3, child: textContent),
                  ],
                )
              : Column(
                  children: [
                    imageContent,
                    const SizedBox(height: 30),
                    textContent,
                  ],
                );
        },
      ),
    );
  }
}
