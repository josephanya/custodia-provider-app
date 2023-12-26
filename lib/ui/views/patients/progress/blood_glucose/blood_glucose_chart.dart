import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/default_card.dart';
import 'package:custodia_provider/ui/widgets/info_card.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BloodGlucoseChart extends StatefulWidget {
  const BloodGlucoseChart({Key? key}) : super(key: key);

  @override
  BloodGlucoseChartState createState() => BloodGlucoseChartState();
}

class BloodGlucoseChartState extends State<BloodGlucoseChart> {
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
        child: Text(
          'Daily',
        ),
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
        'Blood glucose',
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/log-blood-glucose'),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.w,
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
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const YMargin(10),
                    const Row(
                      children: [
                        InfoCard(
                          label: 'Estimated A1c',
                          value: '6.3',
                          color: AppColors.blue,
                          unit: '%',
                        ),
                        XMargin(10),
                        InfoCard(
                          label: 'Daily average',
                          value: '129',
                          color: AppColors.blue,
                          unit: 'mg/dL',
                        ),
                      ],
                    ),
                    const YMargin(20),
                    DefaultCard(
                      onPress: () =>
                          Navigator.pushNamed(context, '/blood-glucose-logs'),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 18.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Show all Readings',
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
