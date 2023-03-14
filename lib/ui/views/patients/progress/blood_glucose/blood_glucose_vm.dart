import 'package:custodia_provider/core/navigation.dart';
import 'package:custodia_provider/repository/patient/patient_impl.dart';
import 'package:custodia_provider/services/api/failure.dart';
import 'package:custodia_provider/ui/core/enums/view_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

final getBloodGlucoseProvider = StateNotifierProvider.autoDispose<
    GetBloodGlucoseVM, GetBloodGlucoseViewState>(
  (ref) => GetBloodGlucoseVM(ref.read),
);

class GetBloodGlucoseVM extends StateNotifier<GetBloodGlucoseViewState> {
  GetBloodGlucoseVM(this._reader) : super(GetBloodGlucoseViewState.initial());

  final Reader _reader;
  final _log = Logger(filter: DevelopmentFilter());

  void initialize(patientID) async {
    await fetchBloodGlucose(patientID);
  }

  Future<void> fetchBloodGlucose(String patientID) async {
    state = state.copyWith(viewState: ViewState.loading);
    try {
      final readings =
          await _reader(patientRepository).getPatientBloodGlucose(patientID);
      if (!mounted) return;
      state = state.copyWith(readings: readings, viewState: ViewState.idle);
    } on Failure catch (e) {
      if (!mounted) return;
      _reader(navigationProvider).showErrorSnackbar(message: e.message);
      state = state.copyWith(viewState: ViewState.error);
      _log.e(e);
    }
    // finally {
    //   if (!mounted) return;
    //   state = state.copyWith(viewState: ViewState.idle);
    // }
  }
}

class GetBloodGlucoseViewState {
  final ViewState viewState;
  final List? readings;

  const GetBloodGlucoseViewState._(
      {required this.viewState, required this.readings});

  factory GetBloodGlucoseViewState.initial() =>
      const GetBloodGlucoseViewState._(viewState: ViewState.idle, readings: []);

  GetBloodGlucoseViewState copyWith({ViewState? viewState, List? readings}) =>
      GetBloodGlucoseViewState._(
          viewState: viewState ?? this.viewState,
          readings: readings ?? this.readings);
}
