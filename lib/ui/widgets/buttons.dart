import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:flutter/material.dart';

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
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          width: 1,
          color: isEnabled ? blue : disabled,
        ),
      ),
      height: 50,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: white,
          backgroundColor: isEnabled ? blue : disabled,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 14,
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
          width: 1,
          color: lightGrey,
        ),
      ),
      height: 50,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: color ?? blue,
          backgroundColor: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 14,
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
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            width: .5,
            color: blue,
          ),
        ),
        height: 32,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: blue,
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
          color: isEnabled ? blue : disabled,
          borderRadius: BorderRadius.circular(16.0),
        ),
        height: 32,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
