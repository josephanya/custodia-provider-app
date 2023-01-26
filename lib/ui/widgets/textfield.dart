import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:flutter/material.dart';

class SustainTextField extends StatelessWidget {
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

  const SustainTextField({
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
      //cursorColor: blue,
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
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: black,
      ),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 13, vertical: 16.2),
        fillColor: white,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: grey,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        suffix: suffix,
        errorStyle: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 11, color: Colors.red),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: lightGrey, width: .5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red[400]!, width: .5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red[400]!, width: .5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: lightGrey, width: .5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: lightGrey, width: .5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: lightGrey,
          ),
        ),
      ),
    );
  }
}

class SustainBorderlessTextField extends StatelessWidget {
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

  const SustainBorderlessTextField({
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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: TextFormField(
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
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: black,
              ),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15.5),
                fillColor: white,
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                filled: true,
                suffix: suffix,
                errorStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11,
                  color: Colors.red,
                ),
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
