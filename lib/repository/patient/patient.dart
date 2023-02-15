import 'package:custodia_provider/models/patient_model.dart';

abstract class Patient {
  Future<List<PatientModel>> getPatients();

  Future getSinglePatient(String patientID);
}
