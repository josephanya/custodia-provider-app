import 'package:custodia_provider/core/navigation.dart';
import 'package:custodia_provider/repository/patient/patient_impl.dart';
import 'package:custodia_provider/services/api/failure.dart';
import 'package:custodia_provider/ui/core/enums/view_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

final getWeightProvider =
    StateNotifierProvider.autoDispose<GetWeightVM, GetWeightViewState>(
  (ref) => GetWeightVM(ref.read),
);

class GetWeightVM extends StateNotifier<GetWeightViewState> {
  GetWeightVM(this._reader) : super(GetWeightViewState.initial());

  final Reader _reader;
  final _log = Logger(filter: DevelopmentFilter());

  void initialize(patientID) async {
    await fetchBloodPressure(patientID);
  }

  Future<void> fetchBloodPressure(String patientID) async {
    state = state.copyWith(viewState: ViewState.loading);
    try {
      final readings =
          await _reader(patientRepository).getPatientWeight(patientID);
      state = state.copyWith(readings: readings, viewState: ViewState.idle);
    } on Failure catch (e) {
      _reader(navigationProvider).showErrorSnackbar(message: e.message);
      state = state.copyWith(viewState: ViewState.error);
      _log.e(e);
    }
    // finally {
    //   state = state.copyWith(viewState: ViewState.idle);
    // }
  }
}

class GetWeightViewState {
  final ViewState viewState;
  final List? readings;

  const GetWeightViewState._({required this.viewState, required this.readings});

  factory GetWeightViewState.initial() =>
      const GetWeightViewState._(viewState: ViewState.idle, readings: []);

  GetWeightViewState copyWith({ViewState? viewState, List? readings}) =>
      GetWeightViewState._(
          viewState: viewState ?? this.viewState,
          readings: readings ?? this.readings);
}
