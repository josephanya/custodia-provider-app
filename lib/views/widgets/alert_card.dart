import 'package:custodia_provider/theme/theme.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/views/widgets/default_card.dart';
import 'package:flutter/material.dart';

class AlertCard extends StatelessWidget {
  const AlertCard({
    Key? key,
    required this.urgent,
  }) : super(key: key);

  final bool urgent;

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      onPress: () => Navigator.pushNamed(context, '/alert-details'),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'New blood pressure log',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            const YMargin(5),
            const Text(
              'Reading: 124/87 mmHg',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            const YMargin(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Ude Mang • 17 min ago',
                  style: TextStyle(
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
