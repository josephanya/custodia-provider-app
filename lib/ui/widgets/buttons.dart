import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.isEnabled = true,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onPressed;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(
          width: 1.w,
          color: isEnabled ? AppColors.blue : AppColors.disabled,
        ),
      ),
      height: 50.h,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.white,
          backgroundColor: isEnabled ? AppColors.blue : AppColors.disabled,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: FontSize.s14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          width: 1.w,
          color: AppColors.lightGrey,
        ),
      ),
      height: 50.h,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: color ?? AppColors.blue,
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: FontSize.s14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class TetiaryButtonOutlined extends StatelessWidget {
  const TetiaryButtonOutlined({
    Key? key,
    required this.onPress,
    required this.buttonText,
    this.isEnabled = true,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onPress;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            width: .5.w,
            color: AppColors.blue,
          ),
        ),
        height: 32.h,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: FontSize.s14,
                fontWeight: FontWeight.w500,
                color: AppColors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TetiaryButtonFilled extends StatelessWidget {
  const TetiaryButtonFilled({
    Key? key,
    required this.onPress,
    required this.buttonText,
    this.isEnabled = true,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onPress;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: isEnabled ? AppColors.blue : AppColors.disabled,
          borderRadius: BorderRadius.circular(16.r),
        ),
        height: 32.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: FontSize.s14,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
