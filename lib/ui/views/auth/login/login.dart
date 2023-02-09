import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/views/auth/login/login_vm.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/buttons.dart';
import 'package:custodia_provider/ui/widgets/loader.dart';
import 'package:custodia_provider/ui/widgets/textfield.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LogIn extends ConsumerWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(loginProvider);
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
                'Login',
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              provider.isLoading
                  ? const Loader()
                  : PrimaryButton(
                      isEnabled: provider.isButtonEnabled,
                      buttonText: 'Log in',
                      onPressed: () =>
                          provider.isButtonEnabled ? provider.login() : null,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
