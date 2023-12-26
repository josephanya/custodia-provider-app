import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          padding: EdgeInsets.fromLTRB(
            16.w,
            statusBarHeight.h + 16.h,
            16.w,
            16.h,
          ),
          color: color,
          child: Text(
            message,
            style: TextStyle(
              fontSize: FontSize.s14,
              color: AppColors.white,
              fontWeight: FontWeight.w400,
              height: 1.357.h,
            ),
          ),
        ),
      ),
    );
  }
}
