import 'package:custodia_provider/ui/core/enums/view_state.dart';
import 'package:custodia_provider/models/provider_model.dart';
import 'package:custodia_provider/repository/provider/provider_impl.dart';
import 'package:custodia_provider/services/api/failure.dart';
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
    await getPatient();
  }

  Future<void> getPatient() async {
    state = state.copyWith(viewState: ViewState.loading);
    try {
      final provider = await _reader(providerRepository).getProvider();
      state = state.copyWith(provider: provider);
    } on Failure catch (e) {
      state = state.copyWith(viewState: ViewState.error);
      _log.e(e);
    } finally {
      state = state.copyWith(viewState: ViewState.idle);
    }
  }
}

class ProfileViewState {
  final ViewState viewState;
  final ProviderModel? provider;

  const ProfileViewState._({required this.viewState, required this.provider});

  factory ProfileViewState.initial() =>
      const ProfileViewState._(viewState: ViewState.idle, provider: null);

  ProfileViewState copyWith({ViewState? viewState, ProviderModel? provider}) =>
      ProfileViewState._(
          viewState: viewState ?? this.viewState,
          provider: provider ?? this.provider);
}
