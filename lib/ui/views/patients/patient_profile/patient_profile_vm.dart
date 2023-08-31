import 'package:custodia_provider/core/navigation.dart';
import 'package:custodia_provider/models/patient_model.dart';
import 'package:custodia_provider/repository/patient/patient_impl.dart';
import 'package:custodia_provider/services/api/failure.dart';
import 'package:custodia_provider/ui/core/enums/view_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

final patientProvider =
    StateNotifierProvider.autoDispose<PatientVM, PatientViewState>(
  (ref) => PatientVM(ref.read),
);

class PatientVM extends StateNotifier<PatientViewState> {
  PatientVM(this._reader) : super(PatientViewState.initial());

  final Reader _reader;
  final _log = Logger(filter: DevelopmentFilter());

  void initialize(String patientID) async {
    await getPatient(patientID);
  }

  Future<void> getPatient(String patientID) async {
    state = state.copyWith(viewState: ViewState.loading);
    try {
      final patient =
          await _reader(patientRepository).getSinglePatient(patientID);
      if (!mounted) return;
      state = state.copyWith(
        patient: patient,
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

class PatientViewState {
  final ViewState viewState;
  final PatientModel? patient;

  const PatientViewState._({
    required this.viewState,
    required this.patient,
  });

  factory PatientViewState.initial() =>
      const PatientViewState._(viewState: ViewState.idle, patient: null);

  PatientViewState copyWith({ViewState? viewState, PatientModel? patient}) =>
      PatientViewState._(
        viewState: viewState ?? this.viewState,
        patient: patient ?? this.patient,
      );
}
