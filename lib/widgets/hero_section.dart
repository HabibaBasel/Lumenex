import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lumenex Health: Deeper Insight for Heart Wellness',
                  style: TextStyle(
                    color: Color(0xFF054753),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'The first integrated Egyptian diagnostic platform powered by AI to analyze heart sounds, medical images, and clinical data.',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2D9E98),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                  ),
                  onPressed: () {},
                  child: const Text('Try the Interactive Demo Now',
                      style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 40),
          Expanded(
            child: Image.asset('assets/stetho.jpeg'),
          )
        ],
      ),
    );
  }
}
