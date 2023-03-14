import 'package:custodia_provider/models/patient_model.dart';
import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/default_card.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';

class PatientDetails extends StatelessWidget {
  const PatientDetails({
    Key? key,
    required this.patient,
  }) : super(key: key);

  final PatientModel patient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Patient details'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 15,
          ),
          child: Column(
            children: [
              DefaultCard(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 25,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'First name',
                            style: TextStyle(
                              color: grey,
                            ),
                          ),
                          Text('${patient.firstName}'),
                        ],
                      ),
                      const YMargin(29),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Last name',
                            style: TextStyle(
                              color: grey,
                            ),
                          ),
                          Text('${patient.lastName}'),
                        ],
                      ),
                      const YMargin(29),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Gender',
                            style: TextStyle(
                              color: grey,
                            ),
                          ),
                          Text('${patient.gender}'),
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
