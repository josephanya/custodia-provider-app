import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/widgets/default_card.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BloodPressureLogCard extends StatelessWidget {
  const BloodPressureLogCard({
    Key? key,
    required this.systolicBloodPressure,
    required this.diastolicBloodPressure,
    required this.date,
  }) : super(key: key);

  final String systolicBloodPressure, diastolicBloodPressure;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              textBaseline: TextBaseline.ideographic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  systolicBloodPressure,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const XMargin(3),
                const Text(
                  'systolic',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const XMargin(8),
                Text(
                  diastolicBloodPressure,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const XMargin(3),
                const Text(
                  'diastolic',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const YMargin(5),
            Text(
              DateFormat('MMM dd, hh:mm aaa').format(date),
              style: const TextStyle(
                fontSize: 12,
                color: grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
