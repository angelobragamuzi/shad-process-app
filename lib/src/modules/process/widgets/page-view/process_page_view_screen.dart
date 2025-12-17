// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shadprocess/src/modules/process/screens/case_form_step_four.dart';
import 'package:shadprocess/src/modules/process/screens/case_form_step_three.dart';
import 'package:shadprocess/src/modules/process/screens/case_form_step_two.dart';
import 'package:shadprocess/src/modules/process/screens/case_form_step_one.dart';
import 'package:shadprocess/src/modules/process/widgets/page-view/page_view_indicator.dart';

class ProcessPageViewScreen extends StatefulWidget {
  const ProcessPageViewScreen({super.key});

  @override
  State<ProcessPageViewScreen> createState() => _ProcessPageViewScreenState();
}

class _ProcessPageViewScreenState extends State<ProcessPageViewScreen> {
  late final ValueNotifier<DateTime> _selectedDateNotifier;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _selectedDateNotifier = ValueNotifier(DateTime.now());
  }

  @override
  void dispose() {
    _selectedDateNotifier.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 29, 29),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Color.fromARGB(255, 4, 177, 230),
              Color.fromARGB(255, 49, 161, 236),
              Color.fromARGB(255, 163, 210, 255),
            ],
          ).createShader(bounds),
          child: const Text(
            'Processos',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.3,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              children: [
                CaseFormStepOne(pageController: _pageController),
                CaseFormStepTwo(pageController: _pageController),
                CaseFormStepThree(pageController: _pageController),
                CaseFormStepFour(pageController: _pageController),
              ],
            ),
          ),
          PageIndicator(currentPage: _currentPage),
        ],
      ),
    );
  }
}
