import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/core/constants/custom_icons.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
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
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 20.h),
                          child: const Icon(
                            CustomIcon.medical_records,
                            size: 30,
                            color: AppColors.blue,
                          ),
                        ),
                      ),
                      const YMargin(20),
                      const Text(
                        'Medical records',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const YMargin(16),
                      Text(
                        'Find your patients medical records in one place',
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: FontSize.s14,
                          height: 1.35.h,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const YMargin(30),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.offWhite,
                    borderRadius: BorderRadius.circular(30),
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
                const YMargin(100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
