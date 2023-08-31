import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/widgets/default_card.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BloodGlucoseLogCard extends StatelessWidget {
  const BloodGlucoseLogCard({
    Key? key,
    required this.bloodGlucose,
    required this.bgContext,
    required this.date,
  }) : super(key: key);

  final String bloodGlucose, bgContext;
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
                  bloodGlucose,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const XMargin(3),
                const Text(
                  'mg/dL',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const XMargin(4),
                Text(
                  '· $bgContext',
                  style: const TextStyle(
                    color: grey,
                    fontSize: 14,
                  ),
                )
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
