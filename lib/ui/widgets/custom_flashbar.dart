import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class Flashbar extends StatelessWidget {
  final String message;
  final Color color;

  const Flashbar({
    required this.message,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return SlideDismissible(
      direction: DismissDirection.up,
      key: ValueKey(key),
      child: Material(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(16, statusBarHeight + 16, 16, 16),
          color: color,
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 14,
              color: white,
              fontWeight: FontWeight.w400,
              height: 1.357,
            ),
          ),
        ),
      ),
    );
  }
}
