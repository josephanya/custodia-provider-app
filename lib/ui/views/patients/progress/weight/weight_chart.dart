import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/widgets/patients/info_card.dart';
import 'package:custodia_provider/ui/widgets/utils/appbar.dart';
import 'package:custodia_provider/ui/widgets/utils/default_card.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeightChart extends StatefulWidget {
  const WeightChart({Key? key}) : super(key: key);

  @override
  WeightChartState createState() => WeightChartState();
}

class WeightChartState extends State<WeightChart> {
  int segmentedControlValue = 0;

  Widget segmentedControl() {
    return SizedBox(
      width: 320.w,
      child: CupertinoSlidingSegmentedControl(
        groupValue: segmentedControlValue,
        padding: const EdgeInsets.all(2),
        children: <int, Widget>{
          0: Text(
            'Daily',
            style: TextStyle(
              fontSize: FontSize.s14,
              fontWeight: FontWeight.w500,
            ),
          ),
          1: Text(
            'Weekly',
            style: TextStyle(
              fontSize: FontSize.s14,
              fontWeight: FontWeight.w500,
            ),
          ),
          2: Text(
            'Monthly',
            style: TextStyle(
              fontSize: FontSize.s14,
              fontWeight: FontWeight.w500,
            ),
          )
        },
        onValueChanged: (int? value) {
          setState(
            () {
              segmentedControlValue = value!;
            },
          );
        },
      ),
    );
  }

  final Map<int, Widget> graph = <int, Widget>{
    0: const SizedBox(
      height: 300,
      child: Center(
        child: Text('Daily'),
      ),
    ),
    1: const SizedBox(
      height: 300,
      child: Center(
        child: Text('Weekly'),
      ),
    ),
    2: const SizedBox(
      height: 300,
      child: Center(
        child: Text('Monthly'),
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithAction(
        context,
        'Weight',
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/log-weight'),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.h,
            ),
            child: Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 6.w,
                  vertical: 6.h,
                ),
                child: const Icon(
                  Icons.add,
                  size: 16,
                  color: AppColors.blue,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const YMargin(12),
              segmentedControl(),
              graph[segmentedControlValue]!,
              const YMargin(30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        InfoCard(
                          label: 'Starting Weight',
                          value: '100',
                          color: AppColors.blue,
                          unit: 'kg',
                        ),
                        XMargin(10),
                        InfoCard(
                          label: 'Weight Lost',
                          value: '129',
                          color: AppColors.blue,
                          unit: 'kg',
                        ),
                      ],
                    ),
                    const YMargin(20),
                    DefaultCard(
                      onPress: () =>
                          Navigator.pushNamed(context, '/weight-logs'),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 18.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'All Readings',
                              style: TextStyle(
                                fontSize: FontSize.s14,
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: AppColors.grey,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
