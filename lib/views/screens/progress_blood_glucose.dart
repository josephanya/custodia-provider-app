import 'package:custodia_provider/theme/theme.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/views/screens/info_card.dart';
import 'package:custodia_provider/views/widgets/appbar.dart';
import 'package:custodia_provider/views/widgets/default_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressBloodGlucose extends StatefulWidget {
  const ProgressBloodGlucose({Key? key}) : super(key: key);

  @override
  _ProgressBloodGlucoseState createState() => _ProgressBloodGlucoseState();
}

class _ProgressBloodGlucoseState extends State<ProgressBloodGlucose> {
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
      appBar: appBar(context, 'Blood glucose'),
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
                          label: 'Before Meal',
                          value: '100',
                          color: blue,
                          unit: 'mg/dL',
                        ),
                        XMargin(10),
                        InfoCard(
                          label: 'After Meal',
                          value: '129',
                          color: blue,
                          unit: 'mg/dL',
                        ),
                      ],
                    ),
                    const YMargin(25),
                    DefaultCard(
                      onPress: () => Navigator.pushNamed(
                          context, '/readings-blood-glucose'),
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
