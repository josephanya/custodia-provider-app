import 'package:custodia_provider/models/alert_model.dart';
import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/views/home/home_vm.dart';
import 'package:custodia_provider/ui/widgets/default_card.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
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
    final provider = ref.watch(homeProvider.notifier);
    return DefaultCard(
      onPress: () => provider.goToAlertDetailView(alert),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              alert.alertType,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            const YMargin(10),
            // const Text(
            //   'Reading: 124/87 mmHg',
            //   style: TextStyle(
            //     fontSize: 12,
            //   ),
            // ),
            // const YMargin(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  timeago.format(alert.triggerTime),
                  style: const TextStyle(
                    fontSize: 12,
                    color: grey,
                  ),
                ),
                urgent
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: lightRed,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          'Urgent',
                          style: TextStyle(
                            color: red,
                            fontSize: 10,
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
