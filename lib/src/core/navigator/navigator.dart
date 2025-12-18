// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:shadprocess/src/core/database/database.dart';
import 'package:shadprocess/src/modules/dashboards/screen/dashboard_screen.dart';
import 'package:shadprocess/src/modules/home/screen/home_screen.dart';
import 'package:shadprocess/src/modules/reports/screen/reports_page.dart';

class NavigatorBottom extends StatefulWidget {
  final AppDatabase db; // Receba o banco aqui para repassar às páginas
  const NavigatorBottom({super.key, required this.db});

  @override
  State<NavigatorBottom> createState() => _NavigatorBottomState();
}

class _NavigatorBottomState extends State<NavigatorBottom> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  // Removido o 'const' e transformado em getter para garantir acesso ao widget.db
  List<Widget> get _pages => [
    const DashboardScreen(),
    const HomeScreen(),
    ReportsPage(db: widget.db), // Injeção do banco corrigida
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
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
        children: _pages, // Usa a lista dinâmica
      ),
      bottomNavigationBar: Container(
        height: 70, // Ajustado levemente para caber labels e ícones sem apertar
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.white10, width: 0.5)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
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
                icon: Icons
                    .auto_awesome_rounded, // Ícone mais "IA" para o ShadBot
                index: 2,
                label: 'ShadBot',
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
      onTap: () => _onItemTapped(index),
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withOpacity(0.05)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFF00D1FF) : Colors.white38,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white38,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
