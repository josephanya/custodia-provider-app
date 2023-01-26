import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:flutter/material.dart';

class DefaultCard extends StatelessWidget {
  final Function()? onPress;
  final Widget child;

  const DefaultCard({
    super.key,
    this.onPress,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: .5,
            color: lightGrey,
          ),
        ),
        child: child,
      ),
    );
  }
}
