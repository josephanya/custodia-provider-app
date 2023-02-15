import 'package:custodia_provider/core/api_base.dart';
import 'package:custodia_provider/models/patient_model.dart';
import 'package:custodia_provider/repository/patient/patient.dart';
import 'package:custodia_provider/services/api/api.dart';
import 'package:custodia_provider/services/api/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final patientRepository = Provider<Patient>(
  (ref) => PatientImpl(ref.read(apiProvider)),
);

class PatientImpl implements Patient {
  PatientImpl(
    this._api,
  );

  final Api _api;

  @override
  Future<List<PatientModel>> getPatients() async {
    final response = await _api.get(ApiBase.patients);
    final result = List<Map<String, dynamic>>.from(response['result']);
    List<PatientModel> patients =
        result.map((patient) => PatientModel.fromJSON(patient)).toList();
    return patients;
  }

  @override
  Future getSinglePatient(String patientID) async {
    final response = await _api.get(ApiBase.patientBase(patientID));
    return PatientModel.fromJSON(response);
  }
}
