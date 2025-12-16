// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CalendarEvent {
  final String title;
  final DateTime date;
  final String type;
  final Color color;

  CalendarEvent({
    required this.title,
    required this.date,
    required this.type,
    required this.color,
  });
}

class CalendarGridWidget extends StatefulWidget {
  const CalendarGridWidget({super.key});

  @override
  State<CalendarGridWidget> createState() => _CalendarGridWidgetState();
}

class _CalendarGridWidgetState extends State<CalendarGridWidget> {
  DateTime _selectedDate = DateTime.now();

  final List<CalendarEvent> _events = [];

  final List<String> _daysOfWeek = [
    'Dom',
    'Seg',
    'Ter',
    'Qua',
    'Qui',
    'Sex',
    'Sáb',
  ];

  DateTime get _firstDayOfMonth =>
      DateTime(_selectedDate.year, _selectedDate.month, 1);

  DateTime get _lastDayOfMonth =>
      DateTime(_selectedDate.year, _selectedDate.month + 1, 0);

  int get _startWeekday => _firstDayOfMonth.weekday % 7;

  int get _gridItemCount =>
      _daysOfWeek.length + _startWeekday + _lastDayOfMonth.day;

  void _goToPreviousMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1);
    });
  }

  void _goToNextMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1);
    });
  }

  List<CalendarEvent> _getEventsForDay(int day) {
    final dayToCheck = DateTime(_selectedDate.year, _selectedDate.month, day);

    return _events.where((event) {
      return event.date.year == dayToCheck.year &&
          event.date.month == dayToCheck.month &&
          event.date.day == dayToCheck.day;
    }).toList();
  }

  String _getMonthName(int month) {
    const names = [
      'Janeiro',
      'Fevereiro',
      'Março',
      'Abril',
      'Maio',
      'Junho',
      'Julho',
      'Agosto',
      'Setembro',
      'Outubro',
      'Novembro',
      'Dezembro',
    ];
    return names[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 36, 36, 36),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 10),
          _buildCalendarGrid(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white70,
            size: 18,
          ),
          onPressed: _goToPreviousMonth,
        ),
        Text(
          '${_getMonthName(_selectedDate.month)} ${_selectedDate.year}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 4, 177, 230),
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white70,
            size: 18,
          ),
          onPressed: _goToNextMonth,
        ),
      ],
    );
  }

  Widget _buildCalendarGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1.0,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: _gridItemCount,
      itemBuilder: (context, index) {
        if (index < _daysOfWeek.length) {
          return Center(
            child: Text(
              _daysOfWeek[index],
              style: TextStyle(
                color: index == 0 || index == 6
                    ? Colors.redAccent
                    : Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          );
        }

        final day = index - _daysOfWeek.length - _startWeekday + 1;

        if (day <= 0 || day > _lastDayOfMonth.day) {
          return const SizedBox.shrink();
        }

        final isToday =
            day == DateTime.now().day &&
            _selectedDate.month == DateTime.now().month &&
            _selectedDate.year == DateTime.now().year;

        final events = _getEventsForDay(day);
        final hasEvent = events.isNotEmpty;

        return GestureDetector(
          onTap: () {
            if (hasEvent) {
              final eventTitles = events.map((e) => e.title).join(', ');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Eventos para o dia $day: $eventTitles'),
                  backgroundColor: const Color(0xFF00FF94),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Dia $day de ${_getMonthName(_selectedDate.month)} selecionado. Sem eventos.',
                  ),
                  backgroundColor: const Color.fromARGB(255, 49, 161, 236),
                ),
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: isToday
                  ? const Color(0xFF04B1E6).withOpacity(0.8)
                  : (hasEvent
                        ? events.first.color.withOpacity(0.2)
                        : Colors.transparent),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: hasEvent ? events.first.color : Colors.transparent,
                width: hasEvent ? 1.5 : 0,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$day',
                  style: TextStyle(
                    color: isToday ? Colors.white : Colors.white,
                    fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                if (hasEvent && !isToday)
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: events.first.color,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
