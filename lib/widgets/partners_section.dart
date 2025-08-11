import 'package:flutter/material.dart';
import 'section_wrapper.dart';

class PartnersSection extends StatelessWidget {
  const PartnersSection({super.key});

  final List<String> partnerLogos = const [
    'assets/alx.png',
    'assets/kasr.png',
    'assets/ins.jpg',
    'assets/part.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Our Partners & Supporters',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF054753),
                ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 70,
            height: 4,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF054753), Color(0xFF2D9E98), Colors.white],
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 32),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 30,
            runSpacing: 24,
            children: partnerLogos
                .map(
                  (logoPath) => _PartnerLogoCard(logoPath: logoPath),
                )
                .toList(),
          ),
          const SizedBox(height: 28),
          Text(
            'We proudly collaborate with reputable institutions in the region to advance diagnostic technology.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black87,
                  height: 1.5,
                ),
          )
        ],
      ),
    );
  }
}

class _PartnerLogoCard extends StatelessWidget {
  final String logoPath;
  const _PartnerLogoCard({required this.logoPath});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Image.asset(
          logoPath,
          height: 60,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
