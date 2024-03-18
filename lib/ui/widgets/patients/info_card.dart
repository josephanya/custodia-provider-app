import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/widgets/utils/default_card.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.color,
    required this.label,
    required this.unit,
    required this.value,
  }) : super(key: key);

  final String value, unit, label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultCard(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: FontSize.s12,
                  color: AppColors.grey,
                ),
              ),
              const YMargin(4),
              Row(
                textBaseline: TextBaseline.ideographic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Text(
                    value,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 26.sp,
                      color: color,
                    ),
                  ),
                  const XMargin(4),
                  Text(
                    unit,
                    style: const TextStyle(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
