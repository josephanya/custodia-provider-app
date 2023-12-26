import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/widgets/default_card.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 15.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              textBaseline: TextBaseline.ideographic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  '$systolicBloodPressure/$diastolicBloodPressure',
                  style: TextStyle(
                    fontSize: FontSize.s20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const XMargin(2),
                Text(
                  'mmHg',
                  style: TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const YMargin(5),
            Row(
              children: [
                Text(
                  DateFormat('MMM dd, hh:mm aaa').format(date),
                  style: TextStyle(
                    fontSize: FontSize.s12,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
