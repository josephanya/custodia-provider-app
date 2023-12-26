import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/views/patients/progress/blood_pressure/blood_pressure_vm.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/blood_pressure_log_card.dart';
import 'package:custodia_provider/ui/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:custodia_provider/ui/core/extensions/view_state.dart';

class BloodPressureLogs extends ConsumerStatefulWidget {
  const BloodPressureLogs({
    Key? key,
    this.patientID,
  }) : super(key: key);

  final String? patientID;

  @override
  BloodPressureLogsState createState() => BloodPressureLogsState();
}

class BloodPressureLogsState extends ConsumerState<BloodPressureLogs> {
  @override
  void initState() {
    super.initState();
    ref.read(getBloodPressureProvider.notifier).initialize(widget.patientID);
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(getBloodPressureProvider);
    return Scaffold(
      appBar: appBar(context, 'All Readings'),
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
                        vertical: 250.h,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'No data yet',
                            style: TextStyle(
                              fontSize: FontSize.s18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const YMargin(12),
                          Text(
                            'Blood pressure readings will show up here',
                            style: TextStyle(
                              color: AppColors.grey,
                              height: 1.35,
                              fontSize: FontSize.s14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ))
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: provider.readings?.length ?? 1,
                      itemBuilder: (context, index) {
                        return BloodPressureLogCard(
                          systolicBloodPressure:
                              provider.readings?[index].systolicBloodPressure,
                          diastolicBloodPressure:
                              provider.readings?[index].diastolicBloodPressure,
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
