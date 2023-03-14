import 'package:custodia_provider/models/patient_model.dart';
import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/views/patients/patient_profile/patient_profile.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';

class PatientsListCard extends StatelessWidget {
  const PatientsListCard({
    Key? key,
    required this.name,
    required this.info,
    required this.patientModel,
  }) : super(key: key);

  final String name, info;
  final PatientModel patientModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PatientProfile(
            patientID: patientModel.patientID,
          ),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 23,
            child: Text(
              '${patientModel.firstName[0].toUpperCase()}${patientModel.lastName[0].toUpperCase()}',
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          const XMargin(13),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YMargin(4),
              Text(
                info,
                style: const TextStyle(
                  fontSize: 12,
                  color: grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
