import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/food_log_card.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:table_calendar/table_calendar.dart';

class FoodEntries extends StatefulWidget {
  const FoodEntries({Key? key}) : super(key: key);

  @override
  State<FoodEntries> createState() => _FoodEntriesState();
}

class _FoodEntriesState extends State<FoodEntries> {
  final CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Food & drinks'),
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: const [
                    FoodLogCard(
                      mealType: 'Lunch',
                      meal:
                          '2 wraps of eba, a plate of oha soup, 1 large sized beef',
                    ),
                    YMargin(12),
                    FoodLogCard(
                      mealType: 'Drink',
                      meal: '1 bottle of 50cl coke',
                    ),
                    YMargin(12),
                    FoodLogCard(
                      mealType: 'Dinner',
                      meal:
                          '2 wraps of eba, a plate of oha soup, 1 large sized beef',
                    ),
                  ],
                ),
              ),
              const YMargin(12),
            ],
          ),
        ),
      ),
    );
  }
}
