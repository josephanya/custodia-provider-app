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

  void initialize() async {
    await fetchAlerts();
  }

  Future<void> fetchAlerts() async {
    state = state.copyWith(viewState: ViewState.loading);
    try {
      final alerts = await _reader(alertRepository).getAlerts();
      if (!mounted) return;
      state = state.copyWith(
        alerts: alerts,
        viewState: ViewState.idle,
      );
    } on Failure catch (e) {
      if (!mounted) return;
      _reader(navigationProvider).showErrorSnackbar(message: e.message);
      state = state.copyWith(viewState: ViewState.error);
      _log.e(e);
    }
  }

  void goToAlertDetailView(AlertModel alert) {
    _reader(navigationProvider)
        .pushNamed('/alert-details', arguments: alert)
        ?.then((value) async {
      final alerts = await _reader(alertRepository).getAlerts();
      state = state.copyWith(
        alerts: alerts,
      );
    });
  }
}

class AlertViewState {
  final ViewState viewState;
  final List? alerts;

  const AlertViewState._({
    required this.viewState,
    required this.alerts,
  });

  factory AlertViewState.initial() =>
      const AlertViewState._(viewState: ViewState.idle, alerts: []);

  AlertViewState copyWith({ViewState? viewState, List? alerts}) =>
      AlertViewState._(
        viewState: viewState ?? this.viewState,
        alerts: alerts ?? this.alerts,
      );
}
