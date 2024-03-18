import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/core/extensions/view_state.dart';
import 'package:custodia_provider/ui/views/auth/login/login_vm.dart';
import 'package:custodia_provider/ui/widgets/utils/appbar.dart';
import 'package:custodia_provider/ui/widgets/utils/buttons.dart';
import 'package:custodia_provider/ui/widgets/utils/loader.dart';
import 'package:custodia_provider/ui/widgets/utils/textfield.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LogIn extends ConsumerWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(loginProvider);
    final providerNotifier = ref.watch(loginProvider.notifier);
    return Scaffold(
      appBar: const AppBarBorderlessWithoutBack(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YMargin(16),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: FontSize.s26,
                  color: AppColors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const YMargin(32),
              Form(
                key: providerNotifier.formKey,
                onChanged: () => providerNotifier.isLoginButtonValid(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: FontSize.s14,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const YMargin(10),
                    AppTextField(
                      isTextArea: true,
                      isPassword: false,
                      autocorrect: false,
                      isEmail: true,
                      isPhone: false,
                      isNumber: false,
                      isEnabled: true,
                      hintText: 'Email address',
                      controller: providerNotifier.emailTEC,
                    ),
                    const YMargin(32),
                    Text(
                      'Password',
                      style: TextStyle(
                        fontSize: FontSize.s14,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const YMargin(10),
                    AppTextField(
                      isTextArea: true,
                      isPassword: true,
                      autocorrect: false,
                      isEmail: false,
                      isPhone: false,
                      isNumber: false,
                      isEnabled: true,
                      hintText: 'Password',
                      controller: providerNotifier.passwordTEC,
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
        color: AppColors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              provider.viewState.isLoading
                  ? const Loader()
                  : PrimaryButton(
                      isEnabled: provider.isLoginButtonEnabled,
                      buttonText: 'Log in',
                      onPressed: () => provider.isLoginButtonEnabled
                          ? providerNotifier.login()
                          : null,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
