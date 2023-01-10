import 'package:custodia_provider/theme/theme.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/views/widgets/default_card.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    Key? key,
    required this.title,
    required this.value,
    required this.route,
  }) : super(key: key);

  final String title, value, route;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultCard(
        onPress: () => Navigator.pushNamed(context, route),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 14, 15, 11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: grey,
                ),
              ),
              const YMargin(5),
              Row(
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const XMargin(6),
                  const Text(
                    '(+ 12 Today)',
                    style: TextStyle(
                      fontSize: 10,
                      color: blue,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
