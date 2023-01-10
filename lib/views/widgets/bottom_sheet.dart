import 'package:custodia_provider/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet {
  const CustomBottomSheet({
    required this.context,
    required this.body,
  });

  final BuildContext context;
  final Widget body;

  void modalBottomSheet() {
    showModalBottomSheet(
      barrierColor: grey.withOpacity(0.4),
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (builder) {
        return Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [body],
            ),
          ),
        );
      },
    );
  }
}
