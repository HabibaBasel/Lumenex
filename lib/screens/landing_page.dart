import 'package:flutter/material.dart';
import 'package:luminixdx_web_ui_en/screens/ai_playground.dart';
import 'package:luminixdx_web_ui_en/widgets/Final_CTA_Section.dart';
import 'package:luminixdx_web_ui_en/widgets/Why_now_section.dart';
import '../widgets/top_nav_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/problem_section.dart';
import '../widgets/solution_section.dart';
import '../widgets/audience_section.dart';
import '../widgets/partners_section.dart';
import '../widgets/contact_section.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {
    'home': GlobalKey(),
    'Why Now': GlobalKey(),
    'problem': GlobalKey(),
    'solution': GlobalKey(),
    'audience': GlobalKey(),
    'cta': GlobalKey(),
    'partners': GlobalKey(),
    'contact': GlobalKey(),
  };

  Map<String, double> _sectionOffsets = {};
  String _activeSection = 'home';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateOffsets();
    });
  }

  void _calculateOffsets() {
    final Map<String, double> offsets = {};
    _sectionKeys.forEach((name, key) {
      final context = key.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        offsets[name] =
            box.localToGlobal(Offset.zero).dy + _scrollController.offset;
      }
    });
    setState(() {
      _sectionOffsets = offsets;
    });
  }

  void _scrollToSection(String section) {
    if (section == 'demo') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const AIPlaygroundScreen()),
      );
      return;
    }

    if (section == 'contact') {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      setState(() {
        _activeSection = section;
      });
      return;
    }

    final targetOffset = _sectionOffsets[section];
    if (targetOffset != null) {
      _scrollController.animateTo(
        targetOffset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      setState(() {
        _activeSection = section;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      endDrawer: NavDrawer(
        onSectionSelected: _scrollToSection,
        activeSection: _activeSection,
      ),
      appBar: TopNavBar(
        scrollController: _scrollController,
        sectionOffsets: _sectionOffsets,
      ),
      body: NotificationListener<SizeChangedLayoutNotification>(
        onNotification: (_) {
          WidgetsBinding.instance
              .addPostFrameCallback((_) => _calculateOffsets());
          return true;
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Container(key: _sectionKeys['home'], child: const HeroSection()),
              Container(
                  key: _sectionKeys['Why Now'], child: const WhyNowSection()),
              Container(
                  key: _sectionKeys['problem'], child: const ProblemSection()),
              Container(
                  key: _sectionKeys['solution'],
                  child: const SolutionSection()),
              Container(
                  key: _sectionKeys['audience'], child: AudienceSection()),
              Container(key: _sectionKeys['cta'], child: FinalCTASection()),
              Container(
                  key: _sectionKeys['partners'],
                  child: const PartnersSection()),
              Container(
                  key: _sectionKeys['contact'], child: const ContactSection()),
            ],
          ),
        ),
      ),
    );
  }
}
