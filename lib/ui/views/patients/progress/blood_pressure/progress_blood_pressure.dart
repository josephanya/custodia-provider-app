import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/default_card.dart';
import 'package:custodia_provider/ui/widgets/info_card.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressBloodPressure extends StatefulWidget {
  const ProgressBloodPressure({Key? key}) : super(key: key);

  @override
  ProgressBloodPressureState createState() => ProgressBloodPressureState();
}

class ProgressBloodPressureState extends State<ProgressBloodPressure> {
  int segmentedControlValue = 0;

  Widget segmentedControl() {
    return Container(
      width: 320,
      child: CupertinoSlidingSegmentedControl(
        groupValue: segmentedControlValue,
        padding: const EdgeInsets.all(2),
        children: const <int, Widget>{
          0: Text(
            'Daily',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          1: Text(
            'Weekly',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          2: Text(
            'Monthly',
            style: TextStyle(
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
    0: Container(
      height: 300,
      child: const Center(
        child: Text('Daily'),
      ),
    ),
    1: Container(
      height: 300,
      child: const Center(
        child: Text('Weekly'),
      ),
    ),
    2: Container(
      height: 300,
      child: const Center(
        child: Text('Monthly'),
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Blood pressure'),
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
                    const Text(
                      'Weekly average',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const YMargin(10),
                    Row(
                      children: const [
                        InfoCard(
                          label: 'Systolic',
                          value: '100',
                          color: blue,
                          unit: 'mmHg',
                        ),
                        XMargin(10),
                        InfoCard(
                          label: 'Diastolic',
                          value: '129',
                          color: blue,
                          unit: 'mmHg',
                        ),
                      ],
                    ),
                    const YMargin(25),
                    DefaultCard(
                      onPress: () => Navigator.pushNamed(
                          context, '/readings-blood-pressure'),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 17,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'All Readings',
                              style: TextStyle(fontSize: 14),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: grey,
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
