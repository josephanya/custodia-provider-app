import 'package:custodia_provider/models/patient_model.dart';
import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/views/patients/patient_profile/patient_profile.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/utils/utility_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientsListCard extends StatelessWidget {
  const PatientsListCard({
    Key? key,
    required this.patientModel,
  }) : super(key: key);

  final PatientModel patientModel;

  @override
  Widget build(BuildContext context) {
    final age = UtilityFunctions.calculateAge(patientModel.dob);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
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
            backgroundColor: AppColors.blue,
            foregroundColor: AppColors.white,
            radius: 23.r,
            child: Text(
              '${patientModel.firstName[0].toUpperCase()}${patientModel.lastName[0].toUpperCase()}',
              style: TextStyle(
                fontSize: FontSize.s15,
              ),
            ),
          ),
          const XMargin(13),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${patientModel.firstName} ${patientModel.lastName}',
                style: TextStyle(
                  fontSize: FontSize.s14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YMargin(4),
              Text(
                '${patientModel.gender} • $age',
                style: TextStyle(
                  fontSize: FontSize.s12,
                  color: AppColors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
