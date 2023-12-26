import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet {
  const CustomBottomSheet({
    required this.context,
    required this.body,
  });

  final BuildContext context;
  final Widget body;

  void modalBottomSheet() {
    showModalBottomSheet(
      barrierColor: AppColors.grey.withOpacity(0.4),
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.r),
        ),
      ),
      builder: (builder) {
        return Container(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 45.h, 20.w, 70.h),
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
