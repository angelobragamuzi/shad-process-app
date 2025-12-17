// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;

  const PageIndicator({super.key, required this.currentPage});

  static const _accentBlue = Color(0xFF00D1FF);
  static const _inactiveColor = Color(0xFF25282C);
  static const _textSub = Color(0xFF8A8F98);

  final List<String> _labels = const [
    'Dados',
    'Prazos',
    'Arquivos',
    'Movimentação',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_labels.length, (index) {
          final isCompleted = index < currentPage;
          final isActive = index == currentPage;

          return Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 2,
                        color: index == 0
                            ? Colors.transparent
                            : (isCompleted || isActive
                                  ? _accentBlue.withOpacity(0.5)
                                  : Colors.white10),
                      ),
                    ),

                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: isActive || isCompleted
                            ? _accentBlue
                            : _inactiveColor,
                        shape: BoxShape.circle,
                        boxShadow: isActive
                            ? [
                                BoxShadow(
                                  color: _accentBlue.withOpacity(0.2),
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                ),
                              ]
                            : [],
                      ),
                      child: Center(
                        child: isCompleted
                            ? const Icon(
                                Icons.check,
                                size: 14,
                                color: Colors.black,
                              )
                            : Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: isActive
                                      ? Colors.black
                                      : Colors.white38,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                ),
                              ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        height: 2,
                        color: index == _labels.length - 1
                            ? Colors.transparent
                            : (isCompleted
                                  ? _accentBlue.withOpacity(0.5)
                                  : Colors.white10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                Text(
                  _labels[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isActive
                        ? _accentBlue
                        : (isCompleted ? Colors.white70 : _textSub),
                    fontSize: 10,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
