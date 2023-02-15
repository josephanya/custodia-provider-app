import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/views/profile/profile_vm.dart';
import 'package:custodia_provider/ui/widgets/alert_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
    ref.read(profileProvider.notifier).initialize();
  }

  int segmentedControlValue = 0;

  Widget segmentedControl() {
    return SizedBox(
      width: double.infinity,
      child: CupertinoSlidingSegmentedControl(
        groupValue: segmentedControlValue,
        padding: const EdgeInsets.all(2),
        children: const <int, Widget>{
          0: Text(
            'Review',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          1: Text(
            'Completed',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
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
        child: Text('Review'),
      ),
    ),
    1: const SizedBox(
      height: 300,
      child: Center(
        child: Text('Completed'),
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(profileProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YMargin(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'images/logo.svg',
                    color: blue,
                    height: 22,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/profile'),
                        child: CircleAvatar(
                          radius: 20,
                          child: Text(
                            '${profile.provider?.firstName![0].toUpperCase()}${profile.provider?.lastName![0].toUpperCase()}',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const YMargin(25),
              segmentedControl(),
              const YMargin(25),
              const AlertCard(
                urgent: true,
              ),
              const YMargin(12),
              const AlertCard(
                urgent: false,
              ),
              const YMargin(12),
              const AlertCard(
                urgent: true,
              ),
              const YMargin(12),
              const AlertCard(
                urgent: true,
              ),
              const YMargin(12),
              const AlertCard(
                urgent: true,
              ),
              const YMargin(12),
              const AlertCard(
                urgent: true,
              ),
              const YMargin(12),
            ],
          ),
        ),
      ),
    );
  }
}
