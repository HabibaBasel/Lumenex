import 'package:flutter/material.dart';
import 'section_wrapper.dart';

class SolutionSection extends StatelessWidget {
  const SolutionSection({super.key});

  Widget _buildParagraph(String text, bool isWide) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        text,
        textAlign: isWide ? TextAlign.left : TextAlign.center,
        style: const TextStyle(
          fontSize: 17,
          height: 1.7,
          color: Colors.black87,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      backgroundColor: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 1100;

          Widget textContent = Column(
            crossAxisAlignment:
                isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Text(
                'The Lumenix Ecosystem: An End-to-End Intelligent Diagnostic Platform.',
                textAlign: isWide ? TextAlign.left : TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF054753),
                      letterSpacing: 1.3,
                      height: 1.3,
                    ),
              ),
              const SizedBox(height: 14),
              Container(
                width: 90,
                height: 5,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF054753),
                      Color(0xFF2D9E98),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(height: 28),
              _buildParagraph(
                "Capture with Precision: Our proprietary Stetho™ Pro device captures crystal-clear, high-fidelity cardiorespiratory sounds, engineered to eliminate ambient noise.",
                isWide,
              ),
              _buildParagraph(
                "Analyze with Superhuman Intelligence: Our Hybrid AI Platform processes this data in seconds. A proprietary Audio-Core AI performs a specialized acoustic analysis, while a Gemini-powered engine correlates it with the patient's full medical context.",
                isWide,
              ),
              _buildParagraph(
                "Act with Confidence: The platform delivers clear, actionable insights—not just data—to the clinician's fingertips, supporting faster, more accurate diagnoses and treatment decisions.",
                isWide,
              ),
              _buildParagraph(
                "Integrate Seamlessly: Lumenix is built to integrate flawlessly with your existing Hospital Information Systems (HIS) and Electronic Health Records (EHR), enhancing your workflow, not disrupting it.",
                isWide,
              ),
            ],
          );

          Widget imageContent = Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/IMG-20250813-WA0072.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          );

          return isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 2, child: textContent),
                    const SizedBox(width: 50),
                    Expanded(flex: 3, child: imageContent),
                  ],
                )
              : Column(
                  children: [
                    textContent,
                    const SizedBox(height: 30),
                    imageContent,
                  ],
                );
        },
      ),
    );
  }
}
