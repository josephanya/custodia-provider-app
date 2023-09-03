import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/views/home/home_vm.dart';
import 'package:custodia_provider/ui/views/profile/profile_vm.dart';
import 'package:custodia_provider/ui/widgets/alert_card.dart';
import 'package:custodia_provider/ui/widgets/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:custodia_provider/ui/core/extensions/view_state.dart';

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
    ref.read(homeProvider.notifier).initialize();
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

  Map<int, Widget> list = <int, Widget>{
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
    final provider = ref.watch(homeProvider);
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
                          backgroundColor: blue,
                          foregroundColor: white,
                          radius: 20,
                          child: Text(
                            '${profile.user?.firstName![0].toUpperCase()}${profile.user?.lastName![0].toUpperCase()}',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // const YMargin(25),
              // segmentedControl(),
              const YMargin(25),
              Column(
                children: [
                  provider.viewState.isLoading
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                            ),
                            child: Loader(),
                          ),
                        )
                      : provider.alerts!.isEmpty || provider.viewState.isError
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 190,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'No alerts yet',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    YMargin(14),
                                    Text(
                                      'Alerts from patient will show up here',
                                      style:
                                          TextStyle(color: grey, height: 1.35),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: provider.alerts?.length ?? 1,
                              itemBuilder: (context, index) {
                                return AlertCard(
                                  urgent: true,
                                  alert: provider.alerts?[index],
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const YMargin(12),
                            ),
                  const YMargin(12),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
