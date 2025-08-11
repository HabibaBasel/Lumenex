import 'package:flutter/material.dart';
import 'package:luminixdx_web_ui_en/screens/ai_playground.dart';

class TopNavBar extends StatefulWidget implements PreferredSizeWidget {
  final ScrollController scrollController;
  final Map<String, double> sectionOffsets;

  const TopNavBar({
    super.key,
    required this.scrollController,
    required this.sectionOffsets,
  });

  @override
  State<TopNavBar> createState() => _TopNavBarState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _TopNavBarState extends State<TopNavBar> {
  String activeSection = 'home';

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_updateActiveSection);
  }

  void _updateActiveSection() {
    final scrollPos = widget.scrollController.position.pixels;
    String current = 'home';

    widget.sectionOffsets.forEach((section, offset) {
      if (scrollPos >= offset - 100) {
        current = section;
      }
    });

    if (current != activeSection) {
      setState(() {
        activeSection = current;
      });
    }
  }

  void _onSectionSelected(String section) {
    if (section == "demo") {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const AIPlaygroundScreen()),
      );
      return;
    }

    final targetOffset = widget.sectionOffsets[section];
    if (targetOffset != null) {
      widget.scrollController.animateTo(
        targetOffset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _navButton(String label, String section) {
    final bool isActive = activeSection == section;
    return GestureDetector(
      onTap: () => _onSectionSelected(section),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isActive ? Colors.white.withOpacity(0.15) : Colors.transparent,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.white.withOpacity(0.85),
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 800;

    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF054753),
              Color(0xff126269),
              Color(0xFF1F7E7F),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
      elevation: 0,
      toolbarHeight: 70,
      titleSpacing: 20,
      title: Row(
        children: [
          Image.asset('assets/logo.jpg', height: 40),
          const SizedBox(width: 12),
          const Text(
            'Lumenex',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          if (!isMobile) ...[
            _navButton('Home', 'home'),
            _navButton('Demo', 'demo'),
            _navButton('Contact', 'contact'),
          ]
        ],
      ),
      actions: isMobile
          ? [
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              )
            ]
          : null,
    );
  }
}

class NavDrawer extends StatelessWidget {
  final Function(String) onSectionSelected;
  final String activeSection;

  const NavDrawer({
    super.key,
    required this.onSectionSelected,
    required this.activeSection,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF054753),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _drawerItem(context, 'Home', 'home'),
          _drawerItem(context, 'Demo', 'demo'),
          _drawerItem(context, 'Contact', 'contact'),
        ],
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String label, String section) {
    final bool isActive = activeSection == section;
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.white70,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        onSectionSelected(section);
      },
    );
  }
}
