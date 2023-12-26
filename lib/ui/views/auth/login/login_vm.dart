import 'package:custodia_provider/core/navigation.dart';
import 'package:custodia_provider/repository/auth/auth_impl.dart';
import 'package:custodia_provider/services/api/failure.dart';
import 'package:custodia_provider/ui/core/enums/view_state.dart';
import 'package:custodia_provider/ui/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/utils/validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginProvider =
    StateNotifierProvider.autoDispose<LoginVM, LoginViewState>(
  (ref) => LoginVM(ref.read),
);

class LoginVM extends StateNotifier<LoginViewState> {
  LoginVM(this._reader) : super(LoginViewState.initial());

  final Reader _reader;

  final formKey = GlobalKey<FormState>();

  final TextEditingController emailTEC = TextEditingController();
  final TextEditingController passwordTEC = TextEditingController();

  isLoginButtonValid() {
    state = state.copyWith(
        isLoginButtonEnabled: (Validator.isPassword(passwordTEC.text)) &&
                (Validator.isEmail(emailTEC.text))
            ? true
            : false);
  }

  void login() async {
    try {
      state = state.copyWith(viewState: ViewState.loading);
      await _reader(authRepository).login(
        email: emailTEC.text,
        password: passwordTEC.text,
      );
      state = state.copyWith(viewState: ViewState.idle);
      _reader(navigationProvider)
          .pushNamedAndRemoveUntil(Routes.bottomNavigationView, (_) => false);
    } on Failure catch (e) {
      state = state.copyWith(viewState: ViewState.idle);
      _reader(navigationProvider).showErrorSnackbar(message: e.message);
    }
  }

  void logout() async {
    try {
      await _reader(authRepository).logout();
      _reader(navigationProvider)
          .pushNamedAndRemoveUntil(Routes.loginView, (_) => false);
    } on Failure catch (e) {
      _reader(navigationProvider).showErrorSnackbar(message: e.message);
    }
  }
}

class LoginViewState {
  final ViewState viewState;
  final bool isLoginButtonEnabled;

  const LoginViewState._({
    required this.viewState,
    required this.isLoginButtonEnabled,
  });

  factory LoginViewState.initial() => const LoginViewState._(
        viewState: ViewState.idle,
        isLoginButtonEnabled: false,
      );

  LoginViewState copyWith({
    ViewState? viewState,
    bool? isLoginButtonEnabled,
  }) =>
      LoginViewState._(
        viewState: viewState ?? this.viewState,
        isLoginButtonEnabled: isLoginButtonEnabled ?? this.isLoginButtonEnabled,
      );
}
