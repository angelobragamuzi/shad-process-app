// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shadprocess/src/modules/home/widgets/calendar_grid.dart';
import 'package:shadprocess/src/modules/home/widgets/create-process/create_process_button.dart';
import 'package:shadprocess/src/modules/home/widgets/process_detail_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ValueNotifier<DateTime> _selectedDateNotifier;

  @override
  void initState() {
    super.initState();
    _selectedDateNotifier = ValueNotifier(DateTime.now());
  }

  @override
  void dispose() {
    _selectedDateNotifier.dispose();
    super.dispose();
  }

  Future<void> _refreshData() async {
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 29, 29),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        elevation: 0,
        title: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Color.fromARGB(255, 4, 177, 230),
              Color.fromARGB(255, 49, 161, 236),
              Color.fromARGB(255, 163, 210, 255),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(bounds),
          child: const Text(
            'Acompanhar Processos',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.3,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshData,
          color: const Color.fromARGB(255, 4, 177, 230),
          backgroundColor: const Color(0xFF0F0F0F),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CreateProcessButton(),
                const SizedBox(height: 20),
                CalendarGrid(dateNotifier: _selectedDateNotifier),
                SizedBox(height: 20),
                ProcessDetailCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
