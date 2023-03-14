import 'package:custodia_provider/core/api_base.dart';
import 'package:custodia_provider/models/blood_glucose_model.dart';
import 'package:custodia_provider/models/blood_pressure_model.dart';
import 'package:custodia_provider/models/food_model.dart';
import 'package:custodia_provider/models/patient_model.dart';
import 'package:custodia_provider/models/weight_model.dart';
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
    final response = await _api.get(ApiBase.patientBase('/$patientID'));
    return PatientModel.fromJSON(response);
  }

  @override
  Future getPatientFood(String patientID) async {
    final response =
        await _api.get(ApiBase.patientBase('/$patientID/biomarker/food'));
    final result = List<Map<String, dynamic>>.from(response['result']);
    List<FoodModel> entries =
        result.map((reading) => FoodModel.fromJSON(reading)).toList();
    return entries;
  }

  @override
  Future getPatientBloodGlucose(String patientID) async {
    final response = await _api
        .get(ApiBase.patientBase('/$patientID/biomarker/blood-glucose'));
    final result = List<Map<String, dynamic>>.from(response['result']);
    List<BloodGlucoseModel> entries =
        result.map((reading) => BloodGlucoseModel.fromJSON(reading)).toList();
    return entries;
  }

  @override
  Future getPatientBloodPressure(String patientID) async {
    final response = await _api
        .get(ApiBase.patientBase('/$patientID/biomarker/blood-pressure'));
    final result = List<Map<String, dynamic>>.from(response['result']);
    List<BloodPressureModel> entries =
        result.map((reading) => BloodPressureModel.fromJSON(reading)).toList();
    return entries;
  }

  @override
  Future getPatientWeight(String patientID) async {
    final response =
        await _api.get(ApiBase.patientBase('/$patientID/biomarker/weight'));
    final result = List<Map<String, dynamic>>.from(response['result']);
    List<WeightModel> entries =
        result.map((reading) => WeightModel.fromJSON(reading)).toList();
    return entries;
  }
}
