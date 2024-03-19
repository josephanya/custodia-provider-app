import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/core/constants/custom_icons.dart';
import 'package:custodia_provider/ui/core/routes.dart';
import 'package:custodia_provider/ui/views/home/alerts_list/alerts_list_vm.dart';
import 'package:custodia_provider/ui/widgets/home/alert_card.dart';
import 'package:custodia_provider/ui/widgets/utils/appbar.dart';
import 'package:custodia_provider/ui/widgets/utils/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    ref.read(alertProvider.notifier).initialize();
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
              // call
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
    final provider = ref.watch(alertProvider);
    return Scaffold(
      appBar: SectionAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'images/logo.svg',
              color: AppColors.blue,
              height: 22.h,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                Routes.profileView,
              ),
              child: Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    width: .5.w,
                    color: AppColors.lightGrey,
                  ),
                ),
                child: const Icon(
                  CustomIcon.profile,
                  size: 18,
                  color: AppColors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YMargin(8),
              // segmentedControl(),
              // const YMargin(20),
              // list[segmentedControlValue]!,
              Column(
                children: [
                  provider.viewState.isLoading
                      ? Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 20.h,
                            ),
                            child: const Loader(),
                          ),
                        )
                      : provider.alerts!.isEmpty || provider.viewState.isError
                          ? Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 50.w,
                                  vertical: 190.h,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'No alerts yet',
                                      style: TextStyle(
                                        fontSize: FontSize.s18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const YMargin(12),
                                    Text(
                                      'Alerts from patient will show up here',
                                      style: TextStyle(
                                        color: AppColors.grey,
                                        height: 1.35.h,
                                      ),
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
