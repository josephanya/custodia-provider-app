import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/utils/margin.dart';
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

class MessageFlashbar extends StatelessWidget {
  final String sender, message;
  final Color color;

  const MessageFlashbar({
    required this.sender,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sender,
                style: TextStyle(
                  fontSize: FontSize.s14,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  height: 1.357.h,
                ),
              ),
              const YMargin(3),
              Text(
                message,
                style: TextStyle(
                  fontSize: FontSize.s14,
                  color: AppColors.white,
                  height: 1.357.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
