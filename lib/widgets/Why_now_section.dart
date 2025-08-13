import 'package:flutter/material.dart';
import 'section_wrapper.dart';

class WhyNowSection extends StatelessWidget {
  const WhyNowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      backgroundColor: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 900;

          final List<Map<String, String>> items = [
            {
              "image": "assets/istockphoto-1598550121-612x612.jpg",
              "caption":
                  "Overworked doctors relying on outdated tools in crowded hospitals"
            },
            {
              "image": "assets/istockphoto-1038526140-612x612.jpg",
              "caption": "46% of deaths in Egypt are\nheart-related"
            },
            {
              "image": "assets/istockphoto-538589338-612x612.jpg",
              "caption": "Costly secondary tests draining resources"
            },
          ];

          Widget buildCard(String image, String caption) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(113, 0, 0, 0),
                        blurRadius: 10,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      height: isWide ? 260 : 220,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    caption,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                  ),
                ),
              ],
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Why Now?",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: const Color(0xFF054753),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      fontSize: 36,
                    ),
              ),
              const SizedBox(height: 12),
              Container(
                width: 80,
                height: 5,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF054753),
                      Color(0xFF2D9E98),
                      Colors.white,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "The urgent need to solve the diagnostic gap in cardiac healthcare.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      height: 1.6,
                    ),
              ),
              const SizedBox(height: 50),
              isWide
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: items
                          .map((item) => Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: buildCard(
                                      item["image"]!, item["caption"]!),
                                ),
                              ))
                          .toList(),
                    )
                  : Column(
                      children: items
                          .map((item) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child:
                                    buildCard(item["image"]!, item["caption"]!),
                              ))
                          .toList(),
                    ),
            ],
          );
        },
      ),
    );
  }
}
