// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:shadprocess/src/modules/dashboards/screen/dashboard_screen.dart';
import 'package:shadprocess/src/modules/home/screen/home_screen.dart';

class NavigatorBottom extends StatefulWidget {
  const NavigatorBottom({super.key});

  @override
  State<NavigatorBottom> createState() => _NavigatorBottomState();
}

class _NavigatorBottomState extends State<NavigatorBottom> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  final List<Widget> _pages = const [DashboardScreen(), HomeScreen()];

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
      body: PageView(
        controller: _pageController,
        // ADICIONADO: Remove a capacidade de arrastar para o lado
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
        children: _pages,
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(border: Border()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(
                icon: Icons.dashboard,
                index: 0,
                label: 'Dashboards',
              ),
              _buildNavItem(
                icon: Icons.calendar_today,
                index: 1,
                label: 'Calendario',
              ),
            ],
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

    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white10 : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedScale(
              scale: isSelected ? 1.05 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : Colors.white54,
                size: 22,
              ),
            ),
            const SizedBox(height: 2),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white54,
                fontSize: isSelected ? 12 : 11,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
