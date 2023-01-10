import 'package:custodia_provider/theme/theme.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/utils/register_provider.dart';
import 'package:custodia_provider/views/widgets/appbar.dart';
import 'package:custodia_provider/views/widgets/buttons.dart';
import 'package:custodia_provider/views/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignIn extends ConsumerWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(signInProvider);
    return Scaffold(
      appBar: const AppBarBorderlessWithoutBack(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YMargin(20),
              const Text(
                'Welcome back',
                style: TextStyle(
                  fontSize: 26,
                  color: blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const YMargin(35),
              Form(
                key: provider.formKey,
                onChanged: () => provider.isValid(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 14,
                        color: black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const YMargin(10),
                    SustainTextField(
                      isTextArea: true,
                      isPassword: false,
                      autocorrect: false,
                      isEmail: true,
                      isPhone: false,
                      isNumber: false,
                      isEnabled: true,
                      hintText: 'Email address',
                      controller: provider.emailTEC,
                    ),
                    const YMargin(35),
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 14,
                        color: black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const YMargin(10),
                    SustainTextField(
                      isTextArea: true,
                      isPassword: true,
                      autocorrect: false,
                      isEmail: false,
                      isPhone: false,
                      isNumber: false,
                      isEnabled: true,
                      hintText: 'Password',
                      controller: provider.passwordTEC,
                    ),
                  ],
                ),
              ),
              YMargin(context.screenHeight(percent: 0.20)),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        color: white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PrimaryButton(
                isEnabled: provider.isButtonEnabled,
                buttonText: 'Log in',
                onPressed: () =>
                    provider.isButtonEnabled ? provider.signIn(context) : null,
              ),
              const YMargin(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: const Text(
                      'Forgot your password?',
                      style: TextStyle(
                        color: blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () =>
                        Navigator.pushNamed(context, '/forgot-password'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
