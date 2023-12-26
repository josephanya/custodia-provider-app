import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultCard extends StatelessWidget {
  const DefaultCard({
    Key? key,
    this.onPress,
    required this.child,
  }) : super(key: key);

  final Function()? onPress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            width: .5.w,
            color: AppColors.lightGrey,
          ),
        ),
        child: child,
      ),
    );
  }
}
