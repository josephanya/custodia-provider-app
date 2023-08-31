import 'package:custodia_provider/core/navigation.dart';
import 'package:custodia_provider/repository/patient/patient_impl.dart';
import 'package:custodia_provider/services/api/failure.dart';
import 'package:custodia_provider/ui/core/enums/view_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

final getBloodPressureProvider = StateNotifierProvider.autoDispose<
    GetBloodPressureVM, GetBloodPressureViewState>(
  (ref) => GetBloodPressureVM(ref.read),
);

class GetBloodPressureVM extends StateNotifier<GetBloodPressureViewState> {
  GetBloodPressureVM(this._reader) : super(GetBloodPressureViewState.initial());

  final Reader _reader;
  final _log = Logger(filter: DevelopmentFilter());

  void initialize(patientID) async {
    await fetchBloodPressure(patientID);
  }

  Future<void> fetchBloodPressure(String patientID) async {
    state = state.copyWith(viewState: ViewState.loading);
    try {
      final readings =
          await _reader(patientRepository).getPatientBloodPressure(patientID);
      if (!mounted) return;
      state = state.copyWith(readings: readings, viewState: ViewState.idle);
    } on Failure catch (e) {
      if (!mounted) return;
      _reader(navigationProvider).showErrorSnackbar(message: e.message);
      state = state.copyWith(viewState: ViewState.error);
      _log.e(e);
    }
  }
}

class GetBloodPressureViewState {
  final ViewState viewState;
  final List? readings;

  const GetBloodPressureViewState._({
    required this.viewState,
    required this.readings,
  });

  factory GetBloodPressureViewState.initial() =>
      const GetBloodPressureViewState._(
        viewState: ViewState.idle,
        readings: [],
      );

  GetBloodPressureViewState copyWith({
    ViewState? viewState,
    List? readings,
  }) =>
      GetBloodPressureViewState._(
        viewState: viewState ?? this.viewState,
        readings: readings ?? this.readings,
      );
}
