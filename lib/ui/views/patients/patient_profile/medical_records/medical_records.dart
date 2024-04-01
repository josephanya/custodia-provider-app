import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/core/constants/custom_icons.dart';
import 'package:custodia_provider/ui/widgets/utils/appbar.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicalRecords extends StatelessWidget {
  const MedicalRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Medical records'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 15.h,
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75.w,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 20.h,
                          ),
                          child: const Icon(
                            CustomIcon.medicalRecords,
                            size: 30,
                            color: AppColors.blue,
                          ),
                        ),
                      ),
                      const YMargin(16),
                      Text(
                        'Medical records',
                        style: TextStyle(
                          fontSize: FontSize.s18,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const YMargin(8),
                      Text(
                        'View your medical records and share with your loved ones',
                        style: TextStyle(
                          fontSize: FontSize.s15,
                          color: AppColors.grey,
                          height: 1.35.h,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const YMargin(24),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 16.h,
                          horizontal: 0.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.offWhite,
                          borderRadius: BorderRadius.circular(30.r),
                          border: Border.all(
                            width: .5.w,
                            color: AppColors.lightGrey,
                          ),
                        ),
                        child: Center(
                            child: Text(
                          'Coming soon..',
                          style: TextStyle(
                            color: AppColors.darkGrey,
                            fontSize: FontSize.s14,
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
                const YMargin(100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
