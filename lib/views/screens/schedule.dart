import 'package:custodia_provider/theme/theme.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/views/widgets/appbar.dart';
import 'package:custodia_provider/views/widgets/appointment_card.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithoutBack(context, 'Schedule'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2040, 3, 14),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
                calendarStyle: CalendarStyle(
                  rangeHighlightColor: blue,
                  isTodayHighlighted: true,
                  selectedDecoration: const BoxDecoration(
                    color: blue,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: blue.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: const HeaderStyle(
                  headerPadding: EdgeInsets.fromLTRB(0, 4, 0, 8),
                  titleTextStyle: TextStyle(fontSize: 16),
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: blue,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: blue,
                  ),
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
              ),
              const YMargin(20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  children: const [
                    AppointmentCard(
                      title: 'title',
                      time: 'time',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
