import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'section_wrapper.dart';

class SolutionSection extends StatelessWidget {
  const SolutionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      backgroundColor: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 900;

          Widget titleAndText = Column(
            crossAxisAlignment:
                isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Text(
                'Our Integrated Solution',
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
                      Colors.white
                    ],
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'LumenexHx is more than a tool — it’s a complete diagnostic ecosystem.\n'
                'Designed to support clinicians in making faster, smarter, and more accurate decisions at the point of care.',
                textAlign: isWide ? TextAlign.left : TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black87,
                      height: 1.8,
                    ),
              ),
              const SizedBox(height: 24),
              const BulletItem(
                icon: FontAwesomeIcons.stethoscope,
                iconColor: Color(0xFF2D9E98),
                text:
                    'Stetho™ Pro – Smart stethoscope with real-time AI support',
              ),
              const BulletItem(
                icon: Icons.psychology_alt,
                iconColor: Color(0xFF2D9E98),
                text:
                    'Lumen™ AI – Multi-input engine for auscultation, images, and patient data',
              ),
              const BulletItem(
                icon: Icons.home_filled,
                iconColor: Color(0xFF2D9E98),
                text:
                    'Lumen™ Home – Our future remote diagnostic hub for home use',
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
                'assets/doctor.jpg',
                height: isWide ? 320 : 240,
                fit: BoxFit.cover,
              ),
            ),
          );

          return isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 3, child: titleAndText),
                    const SizedBox(width: 50),
                    Expanded(flex: 2, child: imageContent),
                  ],
                )
              : Column(
                  children: [
                    titleAndText,
                    const SizedBox(height: 30),
                    imageContent,
                  ],
                );
        },
      ),
    );
  }
}

class BulletItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  const BulletItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black87,
                    height: 1.6,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
