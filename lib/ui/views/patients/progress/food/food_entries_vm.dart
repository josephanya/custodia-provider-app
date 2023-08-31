import 'package:custodia_provider/core/navigation.dart';
import 'package:custodia_provider/repository/patient/patient_impl.dart';
import 'package:custodia_provider/services/api/failure.dart';
import 'package:custodia_provider/ui/core/enums/view_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

final getFoodrovider =
    StateNotifierProvider.autoDispose<GetFoodVM, GetFoodViewState>(
  (ref) => GetFoodVM(ref.read),
);

class GetFoodVM extends StateNotifier<GetFoodViewState> {
  GetFoodVM(this._reader) : super(GetFoodViewState.initial());

  final Reader _reader;
  final _log = Logger(filter: DevelopmentFilter());

  void initialize(patientID) async {
    await fetchFood(patientID);
  }

  Future<void> fetchFood(String patientID) async {
    state = state.copyWith(viewState: ViewState.loading);
    try {
      final entries =
          await _reader(patientRepository).getPatientFood(patientID);
      if (!mounted) return;
      state = state.copyWith(entries: entries, viewState: ViewState.idle);
    } on Failure catch (e) {
      if (!mounted) return;
      _reader(navigationProvider).showErrorSnackbar(message: e.message);
      state = state.copyWith(viewState: ViewState.error);
      _log.e(e);
    }
  }
}

class GetFoodViewState {
  final ViewState viewState;
  final List? entries;

  const GetFoodViewState._({
    required this.viewState,
    required this.entries,
  });

  factory GetFoodViewState.initial() => const GetFoodViewState._(
        viewState: ViewState.idle,
        entries: [],
      );

  GetFoodViewState copyWith({
    ViewState? viewState,
    List? entries,
  }) =>
      GetFoodViewState._(
        viewState: viewState ?? this.viewState,
        entries: entries ?? this.entries,
      );
}
