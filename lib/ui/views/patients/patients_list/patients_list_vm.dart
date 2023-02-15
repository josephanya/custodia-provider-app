// final patientListProvider = ChangeNotifierProvider((ref) => PatientListVM());

// class PatientListVM with ChangeNotifier {
//   final TextEditingController searchTEC = TextEditingController();

//   String searchQuery = "Search query";

//   bool _isSearching = false;

//   bool get isSearching => _isSearching;

//   set isSearching(bool val) {
//     _isSearching = val;
//     notifyListeners();
//   }

//   void startSearch(bool val) {
//     _isSearching = val;
//     notifyListeners();
//   }

//   void updateSearchQuery(String newQuery) {
//     searchQuery = newQuery;
//     notifyListeners();
//   }

//   void stopSearching(bool val) {
//     clearSearchQuery();
//     _isSearching = val;
//     notifyListeners();
//   }

//   void clearSearchQuery() {
//     searchTEC.clear();
//     updateSearchQuery("");
//     notifyListeners();
//   }
// }

import 'package:custodia_provider/services/api/failure.dart';
import 'package:custodia_provider/ui/core/enums/view_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:custodia_provider/repository/patient/patient_impl.dart';

final patientsProvider =
    StateNotifierProvider.autoDispose<PatientsVM, PatientsViewState>(
  (ref) => PatientsVM(ref.read),
);

class PatientsVM extends StateNotifier<PatientsViewState> {
  PatientsVM(this._reader) : super(PatientsViewState.initial());

  final Reader _reader;
  final _log = Logger(filter: DevelopmentFilter());

  void initialize() async {
    await fetchResource();
  }

  Future<void> fetchResource() async {
    state = state.copyWith(viewState: ViewState.loading);
    try {
      final patients = await _reader(patientRepository).getPatients();
      if (!mounted) return;
      state = state.copyWith(patients: patients);
    } on Failure catch (e) {
      state = state.copyWith(viewState: ViewState.error);
      _log.e(e);
    } finally {
      if (!mounted) return;
      state = state.copyWith(viewState: ViewState.idle);
    }
  }
}

class PatientsViewState {
  final ViewState viewState;
  final List? patients;

  const PatientsViewState._({required this.viewState, required this.patients});

  factory PatientsViewState.initial() =>
      const PatientsViewState._(viewState: ViewState.idle, patients: []);

  PatientsViewState copyWith({ViewState? viewState, List? patients}) =>
      PatientsViewState._(
          viewState: viewState ?? this.viewState,
          patients: patients ?? this.patients);
}
