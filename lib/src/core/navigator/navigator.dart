// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:shadprocess/src/core/database/database.dart';
import 'package:shadprocess/src/modules/dashboards/screen/dashboard_screen.dart';
import 'package:shadprocess/src/modules/home/screen/home_screen.dart';
import 'package:shadprocess/src/modules/chatbot/screen/chatbot_page.dart';
import 'package:shadprocess/src/modules/reports/screens/reports_page.dart';

class NavigatorBottom extends StatefulWidget {
  final AppDatabase db;
  const NavigatorBottom({super.key, required this.db});

  @override
  State<NavigatorBottom> createState() => _NavigatorBottomState();
}

class _NavigatorBottomState extends State<NavigatorBottom> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  List<Widget> get _pages => [
    const DashboardScreen(),
    const HomeScreen(),
    ChatbotPage(db: widget.db),
    ReportsPage(db: widget.db),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
        children: _pages,
      ),
      bottomNavigationBar: Container(
        height: 75,
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.white10, width: 0.5)),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  icon: Icons.dashboard_rounded,
                  index: 0,
                  label: 'Dashboards',
                ),
                _buildNavItem(
                  icon: Icons.calendar_month_rounded,
                  index: 1,
                  label: 'Calendário',
                ),
                _buildNavItem(
                  icon: Icons.auto_awesome_rounded,
                  index: 2,
                  label: 'ShadBot',
                ),
                _buildNavItem(
                  icon: Icons.description_rounded,
                  index: 3,
                  label: 'Relatórios',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required int index,
    required String label,
  }) {
    final bool isSelected = _selectedIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () => _onItemTapped(index),
        borderRadius: BorderRadius.circular(20),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.white.withOpacity(0.05)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: isSelected ? const Color(0xFF00D1FF) : Colors.white38,
                  size: 22,
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.white38,
                    fontSize: 10,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
