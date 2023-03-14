import 'package:custodia_provider/models/patient_model.dart';

abstract class Patient {
  Future<List<PatientModel>> getPatients();

  Future getSinglePatient(String patientID);

  Future getPatientFood(String patientID);

  Future getPatientBloodGlucose(String patientID);

  Future getPatientBloodPressure(String patientID);

  Future getPatientWeight(String patientID);
}
