import 'package:custodia_provider/models/alert_model.dart';
import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/views/home/alerts_list/alerts_list_vm.dart';
import 'package:custodia_provider/ui/widgets/default_card.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

class AlertCard extends ConsumerWidget {
  const AlertCard({
    Key? key,
    required this.urgent,
    required this.alert,
  }) : super(key: key);

  final bool urgent;
  final AlertModel alert;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(alertProvider.notifier);
    return DefaultCard(
      onPress: () => provider.goToAlertDetailView(alert),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 15.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              alert.alertType,
              style: TextStyle(
                fontSize: FontSize.s14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const YMargin(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  timeago.format(alert.triggerTime),
                  style: TextStyle(
                    fontSize: FontSize.s12,
                    color: AppColors.grey,
                  ),
                ),
                urgent
                    ? Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.lightRed,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Text(
                          'Urgent',
                          style: TextStyle(
                            color: AppColors.red,
                            fontSize: FontSize.s10,
                          ),
                        ),
                      )
                    : Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
