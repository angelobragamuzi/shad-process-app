// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get_it/get_it.dart';
import 'package:shadprocess/src/core/repository/case/case_repository.dart';
import 'package:shadprocess/src/core/database/database.dart';

class CalendarGrid extends StatelessWidget {
  final ValueNotifier<DateTime> dateNotifier;
  final caseRepository = GetIt.I<CaseRepository>();

  CalendarGrid({super.key, required this.dateNotifier});

  // Método para mudar o mês
  void _changeMonth(DateTime current, int offset) {
    final newDate = DateTime(current.year, current.month + offset, 1);
    dateNotifier.value = newDate;
  }

  @override
  Widget build(BuildContext context) {
    // Cores padronizadas com o Dashboard
    const Color cardBg = Color(0xFF1A1D21);
    const Color accent = Color(0xFF00D1FF);
    final Color borderColor = Colors.white.withOpacity(0.08);
    const Color textSub = Color(0xFF8A8F98);

    return ValueListenableBuilder<DateTime>(
      valueListenable: dateNotifier,
      builder: (context, currentDate, _) {
        final firstDayOfMonth = DateTime(
          currentDate.year,
          currentDate.month,
          1,
        );
        final firstDay = firstDayOfMonth.subtract(
          Duration(days: firstDayOfMonth.weekday - 1),
        );
        final daysInMonth = DateUtils.getDaysInMonth(
          currentDate.year,
          currentDate.month,
        );
        final totalCells =
            ((daysInMonth + firstDayOfMonth.weekday - 1) / 7).ceil() * 7;

        return FutureBuilder<List<LegalCase>>(
          future: caseRepository.getAvailableCases(),
          builder: (context, snapshot) {
            final allCases = snapshot.data ?? [];

            return Container(
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(
                  20,
                ), // Arredondamento padronizado
                border: Border.all(color: borderColor),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // HEADER DO CALENDÁRIO
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => _changeMonth(currentDate, -1),
                        icon: const Icon(Icons.chevron_left, color: textSub),
                      ),
                      Text(
                        DateFormat.yMMMM(
                          'pt_BR',
                        ).format(currentDate).toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.2,
                        ),
                      ),
                      IconButton(
                        onPressed: () => _changeMonth(currentDate, 1),
                        icon: const Icon(Icons.chevron_right, color: textSub),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // DIAS DA SEMANA (SEG, TER...)
                  Row(
                    children: List.generate(7, (index) {
                      final weekday = DateFormat.E(
                        'pt_BR',
                      ).format(DateTime(2024, 1, index + 1));
                      return Expanded(
                        child: Center(
                          child: Text(
                            weekday.substring(0, 3).toUpperCase(),
                            style: const TextStyle(
                              fontSize: 10,
                              color: textSub,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 10),

                  // GRID DE DIAS
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: totalCells,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 6,
                        ),
                    itemBuilder: (context, index) {
                      final day = firstDay.add(Duration(days: index));
                      final isSelected = DateUtils.isSameDay(
                        day,
                        dateNotifier.value,
                      );
                      final isToday = DateUtils.isSameDay(day, DateTime.now());
                      final isCurrentMonth = day.month == currentDate.month;

                      final hasProcess = allCases.any(
                        (c) => DateUtils.isSameDay(c.startDate, day),
                      );

                      return GestureDetector(
                        onTap: () => dateNotifier.value = day,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: isSelected ? accent : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            border: isToday && !isSelected
                                ? Border.all(
                                    color: accent.withOpacity(0.5),
                                    width: 1.5,
                                  )
                                : null,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                '${day.day}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: isSelected
                                      ? Colors.black
                                      : (isCurrentMonth
                                            ? Colors.white
                                            : Colors.white24),
                                  fontWeight: isSelected || isToday
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              if (hasProcess && !isSelected)
                                Positioned(
                                  bottom: 6,
                                  child: Container(
                                    width: 4,
                                    height: 4,
                                    decoration: const BoxDecoration(
                                      color: accent,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
