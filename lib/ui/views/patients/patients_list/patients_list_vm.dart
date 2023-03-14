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

import 'package:custodia_provider/core/navigation.dart';
import 'package:custodia_provider/services/api/failure.dart';
import 'package:custodia_provider/ui/core/enums/view_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:custodia_provider/repository/patient/patient_impl.dart';

final patientListProvider =
    StateNotifierProvider.autoDispose<PatientlistVM, PatientListViewState>(
  (ref) => PatientlistVM(ref.read),
);

class PatientlistVM extends StateNotifier<PatientListViewState> {
  PatientlistVM(this._reader) : super(PatientListViewState.initial());

  final Reader _reader;
  final _log = Logger(filter: DevelopmentFilter());

  void initialize() async {
    await fetchPatientList();
  }

  Future<void> fetchPatientList() async {
    state = state.copyWith(viewState: ViewState.loading);
    try {
      final patients = await _reader(patientRepository).getPatients();
      if (!mounted) return;
      state = state.copyWith(patients: patients, viewState: ViewState.idle);
    } on Failure catch (e) {
      state = state.copyWith(viewState: ViewState.error);
      _reader(navigationProvider).showErrorSnackbar(message: e.message);
      _log.e(e);
    }
  }
}

class PatientListViewState {
  final ViewState viewState;
  final List? patients;

  const PatientListViewState._(
      {required this.viewState, required this.patients});

  factory PatientListViewState.initial() =>
      const PatientListViewState._(viewState: ViewState.idle, patients: []);

  PatientListViewState copyWith({ViewState? viewState, List? patients}) =>
      PatientListViewState._(
          viewState: viewState ?? this.viewState,
          patients: patients ?? this.patients);
}
