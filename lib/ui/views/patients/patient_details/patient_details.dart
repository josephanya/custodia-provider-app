import 'package:custodia_provider/models/patient_model.dart';
import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/widgets/utils/appbar.dart';
import 'package:custodia_provider/ui/widgets/utils/default_card.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/utils/utility_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class PatientDetails extends StatelessWidget {
  const PatientDetails({
    Key? key,
    required this.patient,
  }) : super(key: key);

  final PatientModel patient;

  Future<void> _openLink(String urlString) async {
    final Uri url = Uri.parse(urlString);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final age = UtilityFunctions.calculateAge(patient.dob);
    return Scaffold(
      appBar: appBar(context, 'Patient details'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 15.h,
          ),
          child: Column(
            children: [
              DefaultCard(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 25.h,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'First name',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: FontSize.s14,
                            ),
                          ),
                          Text(
                            patient.firstName,
                            style: TextStyle(
                              fontSize: FontSize.s14,
                            ),
                          ),
                        ],
                      ),
                      const YMargin(29),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Last name',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: FontSize.s14,
                            ),
                          ),
                          Text(
                            patient.lastName,
                            style: TextStyle(
                              fontSize: FontSize.s14,
                            ),
                          ),
                        ],
                      ),
                      const YMargin(29),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Gender',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: FontSize.s14,
                            ),
                          ),
                          Text(
                            patient.gender,
                            style: TextStyle(
                              fontSize: FontSize.s14,
                            ),
                          ),
                        ],
                      ),
                      const YMargin(29),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: FontSize.s14,
                            ),
                          ),
                          Text(
                            age,
                            style: TextStyle(
                              fontSize: FontSize.s14,
                            ),
                          ),
                        ],
                      ),
                      const YMargin(29),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Phone number',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: FontSize.s14,
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                _openLink('tel:+${patient.phoneNumber}'),
                            child: Text(
                              '+${patient.phoneNumber}',
                              style: TextStyle(
                                fontSize: FontSize.s14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
