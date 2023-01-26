import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/default_card.dart';
import 'package:flutter/material.dart';

final List patientInformation = [
  {'key': 'First name', 'value': 'Yetunde'},
  {'key': 'Last name', 'value': 'Abaniwonda'},
  {'key': 'Patient ID', 'value': '4783484'},
  {'key': 'Age', 'value': '34 yo'},
  {'key': 'Gender', 'value': 'Female'},
  {'key': 'Location', 'value': 'Abuja, NG'},
];

class PatientDetails extends StatelessWidget {
  const PatientDetails({Key? key}) : super(key: key);

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
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          patientInformation[index]['key'],
                          style: const TextStyle(
                            color: grey,
                          ),
                        ),
                        Text(
                          patientInformation[index]['value'],
                        ),
                      ],
                    ),
                  ),
                  itemCount: patientInformation.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
