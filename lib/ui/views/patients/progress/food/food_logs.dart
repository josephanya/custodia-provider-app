import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/views/patients/progress/food/food_logs_vm.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/food_log_card.dart';
import 'package:custodia_provider/ui/widgets/loader.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:custodia_provider/ui/core/extensions/view_state.dart';

class FoodLogs extends ConsumerStatefulWidget {
  const FoodLogs({
    Key? key,
    this.patientID,
  }) : super(key: key);

  final String? patientID;
  @override
  ConsumerState<FoodLogs> createState() => _FoodLogsState();
}

class _FoodLogsState extends ConsumerState<FoodLogs> {
  @override
  void initState() {
    super.initState();
    ref.read(getFoodrovider.notifier).initialize(widget.patientID);
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(getFoodrovider);
    return Scaffold(
      appBar: appBar(context, 'Food'),
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
              : provider.entries!.isEmpty || provider.viewState.isError
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
                              'Food entries will show up here',
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
                      itemCount: provider.entries?.length ?? 1,
                      itemBuilder: (context, index) {
                        return FoodLogCard(
                          food: provider.entries?[index].food,
                          mealType: provider.entries?[index].mealType,
                          imageURL: provider.entries?[index].imageURL,
                          date: provider.entries?[index].timestamp,
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
