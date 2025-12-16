// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarGrid extends StatelessWidget {
  final ValueNotifier<DateTime> dateNotifier;

  const CalendarGrid({super.key, required this.dateNotifier});

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFF1B1B1B);
    const Color borderColor = Color(0xFFE5E5E5);

    const Color dayTextColor = Color(0xFFE5E5E5);
    const Color fadedTextColor = Color(0xFF8A8A8A);

    const Color selectedColor = Color(0xFF2E2E2E);
    const Color todayBorderColor = Color(0xFF5A5A5A);

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
            ((daysInMonth + firstDay.weekday - 1) / 7).ceil() * 7;

        void changeMonth(int offset) {
          final newDate = DateTime(
            currentDate.year,
            currentDate.month + offset,
            1,
          );

          final maxDay = DateUtils.getDaysInMonth(newDate.year, newDate.month);

          dateNotifier.value = DateTime(
            newDate.year,
            newDate.month,
            currentDate.day.clamp(1, maxDay),
          );
        }

        return Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor),
          ),
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => changeMonth(-1),
                    icon: const Icon(Icons.chevron_left),
                    color: fadedTextColor,
                    splashRadius: 20,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        DateFormat.yMMMM('pt_BR').format(currentDate),
                        style: const TextStyle(
                          color: dayTextColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => changeMonth(1),
                    icon: const Icon(Icons.chevron_right),
                    color: fadedTextColor,
                    splashRadius: 20,
                  ),
                ],
              ),

              const SizedBox(height: 12),

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
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: fadedTextColor,
                        ),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 10),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: totalCells,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                ),
                itemBuilder: (context, index) {
                  final day = firstDay.add(Duration(days: index));

                  final isToday = DateUtils.isSameDay(day, DateTime.now());
                  final isSelected = DateUtils.isSameDay(
                    day,
                    dateNotifier.value,
                  );
                  final isCurrentMonth = day.month == currentDate.month;

                  return GestureDetector(
                    onTap: () => dateNotifier.value = day,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected ? selectedColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: isToday && !isSelected
                            ? Border.all(color: todayBorderColor, width: 1)
                            : null,
                      ),
                      child: Text(
                        '${day.day}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.normal,
                          color: isSelected
                              ? dayTextColor
                              : isCurrentMonth
                              ? dayTextColor
                              : fadedTextColor,
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 18),
            ],
          ),
        );
      },
    );
  }
}
