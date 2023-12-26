import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final Widget? suffix;
  final VoidCallback? onTap;
  final bool autocorrect,
      isEmail,
      isPhone,
      isNumber,
      isPassword,
      isTextArea,
      isEnabled;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged, onSaved;
  final TextEditingController controller;
  final String hintText;

  const AppTextField({
    super.key,
    this.suffix,
    this.onTap,
    this.onChanged,
    this.validator,
    required this.autocorrect,
    required this.isEmail,
    required this.isNumber,
    required this.isPassword,
    required this.isPhone,
    required this.controller,
    required this.isTextArea,
    required this.isEnabled,
    this.onSaved,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      enabled: isEnabled,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      maxLines: isTextArea && !isPassword
          ? null
          : isPassword
              ? 1
              : 3,
      keyboardType: isEmail
          ? TextInputType.emailAddress
          : isPhone
              ? TextInputType.phone
              : isNumber
                  ? const TextInputType.numberWithOptions(decimal: true)
                  : TextInputType.text,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.s14,
        height: 1.35.h,
        color: AppColors.black,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.5.h,
        ),
        fillColor: AppColors.white,
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.grey,
          fontSize: FontSize.s14,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        suffix: suffix,
        errorStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: FontSize.s11,
          color: Colors.red,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: AppColors.lightGrey,
            width: .5.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: Colors.red[400]!,
            width: .5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: Colors.red[400]!,
            width: .5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
            width: .5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
            width: .5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
          ),
        ),
      ),
    );
  }
}

class AppBorderlessTextField extends StatelessWidget {
  final Widget? suffix;
  final VoidCallback? onTap;
  final bool autocorrect,
      isEmail,
      isPhone,
      isNumber,
      isPassword,
      isTextArea,
      isEnabled;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged, onSaved;
  final TextEditingController controller;
  final String hintText;

  const AppBorderlessTextField({
    super.key,
    this.suffix,
    this.onTap,
    this.onChanged,
    this.validator,
    required this.autocorrect,
    required this.isEmail,
    required this.isNumber,
    required this.isPassword,
    required this.isPhone,
    required this.controller,
    required this.isTextArea,
    required this.isEnabled,
    this.onSaved,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          enabled: isEnabled,
          validator: validator,
          onChanged: onChanged,
          onTap: onTap,
          maxLines: isTextArea && !isPassword
              ? null
              : isPassword
                  ? 1
                  : 3,
          keyboardType: isEmail
              ? TextInputType.emailAddress
              : isPhone
                  ? TextInputType.phone
                  : isNumber
                      ? const TextInputType.numberWithOptions(decimal: true)
                      : TextInputType.text,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: FontSize.s14,
            color: AppColors.black,
          ),
          decoration: InputDecoration.collapsed(
            fillColor: AppColors.white,
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.grey,
              fontSize: FontSize.s14,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            border: InputBorder.none,
          ),
        )
      ],
    );
  }
}
