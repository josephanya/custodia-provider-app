import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/core/constants/custom_icons.dart';
import 'package:custodia_provider/ui/views/patients/progress/blood_glucose/blood_glucose_vm.dart';
import 'package:custodia_provider/ui/widgets/patients/blood_glucose_log_card.dart';
import 'package:custodia_provider/ui/widgets/utils/appbar.dart';
import 'package:custodia_provider/ui/widgets/utils/loader.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:custodia_provider/ui/core/extensions/view_state.dart';

class BloodGlucoseLogs extends ConsumerStatefulWidget {
  const BloodGlucoseLogs({
    Key? key,
    this.patientID,
  }) : super(key: key);

  final String? patientID;

  @override
  BloodGlucoseLogsState createState() => BloodGlucoseLogsState();
}

class BloodGlucoseLogsState extends ConsumerState<BloodGlucoseLogs> {
  @override
  void initState() {
    super.initState();
    ref.read(getBloodGlucoseProvider.notifier).initialize(widget.patientID);
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(getBloodGlucoseProvider);
    return Scaffold(
      appBar: appBar(context, 'Blood glucose'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          child: provider.viewState.isLoading
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                    ),
                    child: const Loader(),
                  ),
                )
              : provider.readings!.isEmpty || provider.viewState.isError
                  ? Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 50.w,
                          vertical: 180.h,
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.lightBlue,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                  vertical: 20.h,
                                ),
                                child: const Icon(
                                  CustomIcon.bloodGlucose,
                                  size: 30,
                                  color: AppColors.blue,
                                ),
                              ),
                            ),
                            const YMargin(16),
                            Text(
                              'No data yet',
                              style: TextStyle(
                                fontSize: FontSize.s18,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const YMargin(8),
                            Text(
                              'Blood glucose readings will show up here',
                              style: TextStyle(
                                fontSize: FontSize.s14,
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
                      itemCount: provider.readings?.length ?? 1,
                      itemBuilder: (context, index) {
                        return BloodGlucoseLogCard(
                          bloodGlucose: provider.readings?[index].bloodGlucose,
                          bgContext: provider.readings?[index].context,
                          date: provider.readings?[index].timestamp,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const YMargin(12);
                      },
                    ),
        ),
      ),
    );
  }
}
