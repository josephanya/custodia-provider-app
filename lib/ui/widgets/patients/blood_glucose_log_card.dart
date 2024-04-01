import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/widgets/utils/default_card.dart';
import 'package:custodia_provider/utils/date.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  bloodGlucose,
                  style: TextStyle(
                    fontSize: FontSize.s20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const XMargin(3),
                Text(
                  'mg/dL',
                  style: TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const YMargin(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  CustomDate().formatDate(date),
                  style: TextStyle(
                    fontSize: FontSize.s12,
                    color: AppColors.grey,
                  ),
                ),
                Text(
                  bgContext,
                  style: TextStyle(
                    fontSize: 12.sp,
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
