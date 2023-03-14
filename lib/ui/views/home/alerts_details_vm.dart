import 'package:custodia_provider/core/navigation.dart';
import 'package:custodia_provider/models/alert_model.dart';
import 'package:custodia_provider/repository/alert/alert_impl.dart';
import 'package:custodia_provider/services/api/failure.dart';
import 'package:custodia_provider/ui/core/enums/view_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

final alertProvider =
    StateNotifierProvider.autoDispose<AlertVM, AlertViewState>(
  (ref) => AlertVM(ref.read),
);

class AlertVM extends StateNotifier<AlertViewState> {
  AlertVM(this._reader) : super(AlertViewState.initial());

  final Reader _reader;
  final _log = Logger(filter: DevelopmentFilter());

  void initialize(String alertID) async {
    await fetchAlerts(alertID);
  }

  Future<void> fetchAlerts(String alertID) async {
    state = state.copyWith(viewState: ViewState.loading);
    try {
      final alert = await _reader(alertRepository).getSingleAlert(alertID);
      if (!mounted) return;
      state = state.copyWith(
        alert: alert,
        viewState: ViewState.idle,
      );
    } on Failure catch (e) {
      if (!mounted) return;
      _reader(navigationProvider).showErrorSnackbar(message: e.message);
      state = state.copyWith(viewState: ViewState.error);
      _log.e(e);
    }
  }
}

class AlertViewState {
  final ViewState viewState;
  final AlertModel? alert;

  const AlertViewState._({
    required this.viewState,
    required this.alert,
  });

  factory AlertViewState.initial() =>
      const AlertViewState._(viewState: ViewState.idle, alert: null);

  AlertViewState copyWith({ViewState? viewState, AlertModel? alert}) =>
      AlertViewState._(
        viewState: viewState ?? this.viewState,
        alert: alert ?? this.alert,
      );
}
