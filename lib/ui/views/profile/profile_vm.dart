import 'package:custodia_provider/core/navigation.dart';
import 'package:custodia_provider/services/api/failure.dart';
import 'package:custodia_provider/ui/core/enums/view_state.dart';
import 'package:custodia_provider/models/user_model.dart';
import 'package:custodia_provider/repository/user/user_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

final profileProvider =
    StateNotifierProvider.autoDispose<ProfileVM, ProfileViewState>(
  (ref) => ProfileVM(ref.read),
);

class ProfileVM extends StateNotifier<ProfileViewState> {
  ProfileVM(this._reader) : super(ProfileViewState.initial());

  final Reader _reader;
  final _log = Logger(filter: DevelopmentFilter());

  void initialize() async {
    await getUserProfile();
  }

  Future<void> getUserProfile() async {
    state = state.copyWith(viewState: ViewState.loading);
    try {
      final user = await _reader(userRepository).getUser();
      state = state.copyWith(user: user);
    } on Failure catch (e) {
      _reader(navigationProvider).showErrorSnackbar(message: e.message);
      state = state.copyWith(viewState: ViewState.error);
      _log.e(e);
    } finally {
      state = state.copyWith(viewState: ViewState.idle);
    }
  }
}

class ProfileViewState {
  final ViewState viewState;
  final UserModel? user;

  const ProfileViewState._({
    required this.viewState,
    required this.user,
  });

  factory ProfileViewState.initial() => const ProfileViewState._(
        viewState: ViewState.idle,
        user: null,
      );

  ProfileViewState copyWith({
    ViewState? viewState,
    UserModel? user,
  }) =>
      ProfileViewState._(
        viewState: viewState ?? this.viewState,
        user: user ?? this.user,
      );
}
