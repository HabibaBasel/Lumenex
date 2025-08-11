import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'section_wrapper.dart';

class AudienceSection extends StatelessWidget {
  AudienceSection({super.key});

  final List<Map<String, dynamic>> audiences = [
    {
      'icon': LucideIcons.stethoscope,
      'title': 'Cardiologists',
      'desc': 'Advanced tools for heart sound analysis and diagnosis.'
    },
    {
      'icon': LucideIcons.activitySquare,
      'title': 'Internal Medicine',
      'desc': 'Support for complex symptom triage and clinical decisions.'
    },
    {
      'icon': LucideIcons.heartPulse,
      'title': 'Emergency Departments',
      'desc': 'Fast, AI-assisted triage for critical cardiac cases.'
    },
    {
      'icon': LucideIcons.school,
      'title': 'Teaching Hospitals',
      'desc': 'Training future doctors on AI-enhanced diagnostics.'
    },
    {
      'icon': LucideIcons.cross,
      'title': 'Rural Clinics',
      'desc': 'Bring smart cardiac diagnostics to underserved regions.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      backgroundColor: const Color(0xFFF0F6F4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Who is LumenexHx for?',
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
                colors: [
                  Color(0xFF054753),
                  Color(0xFF2D9E98),
                  Color(0xFFF0F6F4)
                ],
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              int columnCount = constraints.maxWidth > 900
                  ? 3
                  : constraints.maxWidth > 600
                      ? 2
                      : 1;

              double itemWidth = constraints.maxWidth / columnCount - 30;

              return Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: audiences
                    .map(
                      (audience) => SizedBox(
                        width: itemWidth > 300 ? 300 : itemWidth,
                        child: _AudienceCard(
                          icon: audience['icon'] as IconData,
                          title: audience['title'] as String,
                          desc: audience['desc'] as String,
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _AudienceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const _AudienceCard({
    required this.icon,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFF054753), Color(0xFF2D9E98)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Icon(icon, size: 28, color: Colors.white),
            ),
            const SizedBox(height: 14),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF054753),
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black87,
                    height: 1.5,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
