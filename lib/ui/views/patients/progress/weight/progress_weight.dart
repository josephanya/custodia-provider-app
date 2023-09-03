import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/default_card.dart';
import 'package:custodia_provider/ui/widgets/info_card.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressWeight extends StatefulWidget {
  const ProgressWeight({Key? key}) : super(key: key);

  @override
  ProgressWeightState createState() => ProgressWeightState();
}

class ProgressWeightState extends State<ProgressWeight> {
  int segmentedControlValue = 0;

  Widget segmentedControl() {
    return SizedBox(
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
      appBar: appBar(context, 'Weight'),
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
                      'Weekly Average',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const YMargin(10),
                    const Row(
                      children: [
                        InfoCard(
                          label: 'Starting Weight',
                          value: '100',
                          color: blue,
                          unit: 'kg',
                        ),
                        XMargin(10),
                        InfoCard(
                          label: 'Weight Lost',
                          value: '129',
                          color: blue,
                          unit: 'kg',
                        ),
                      ],
                    ),
                    const YMargin(25),
                    DefaultCard(
                      onPress: () =>
                          Navigator.pushNamed(context, '/readings-weight'),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 17,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
