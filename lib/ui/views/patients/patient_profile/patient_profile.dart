import 'package:custodia_provider/models/patient_model.dart';
import 'package:custodia_provider/ui/core/theme/custom_icons.dart';
import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/buttons.dart';
import 'package:custodia_provider/ui/widgets/default_card.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:url_launcher/url_launcher.dart';

final List biomarkerOptions = [
  {'name': 'Blood glucose', 'route': '/blood-glucose-progress'},
  {'name': 'Blood pressure', 'route': '/blood-pressure-progress'},
  {'name': 'Weight', 'route': '/weight-progress'},
];

final List dietOptions = [
  {'name': 'Food & drinks', 'route': '/food-entries'},
  {'name': 'Meal planner', 'route': '/meal-planner'},
  {'name': 'Food list', 'route': '/meal-planner'},
];

class PatientProfile extends StatelessWidget {
  const PatientProfile({
    Key? key,
    required this.patientModel,
  }) : super(key: key);

  final PatientModel patientModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, ''),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Text(
                      '${patientModel.firstName[0].toUpperCase()}${patientModel.lastName[0].toUpperCase()}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  TetiaryButtonOutlined(
                    onPress: () => Navigator.pushNamed(context, '/chat'),
                    buttonText: 'Message',
                  ),
                ],
              ),
              const YMargin(15),
              Text(
                '${patientModel.firstName} ${patientModel.lastName}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YMargin(4),
              Text(
                patientModel.gender,
                style: const TextStyle(
                  color: grey,
                  fontSize: 13,
                ),
              ),
              const YMargin(30),
              DefaultCard(
                child: Column(
                  children: const [
                    Option(
                      optionName: 'Patient details',
                      optionRoute: '/patient-details',
                      icon: Icon(
                        CustomIcon.information,
                        size: 20,
                        color: blue,
                      ),
                    ),
                    LinkOption(
                      optionName: 'Medical records',
                      optionLink: 'https://custodiahealth.com/terms-of-use',
                      icon: Icon(
                        CustomIcon.medical_records,
                        size: 20,
                        color: blue,
                      ),
                    ),
                  ],
                ),
              ),
              const YMargin(40),
              const Text(
                'Diet',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YMargin(15),
              DefaultCard(
                child: Column(
                  children: const [
                    Option(
                      optionName: 'Food',
                      optionRoute: '/food-entries',
                      icon: Icon(
                        CustomIcon.food,
                        size: 20,
                        color: blue,
                      ),
                    ),
                  ],
                ),
              ),
              const YMargin(40),
              const Text(
                'Biomarkers',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YMargin(15),
              DefaultCard(
                child: Column(
                  children: const [
                    Option(
                      optionName: 'Blood glucose',
                      optionRoute: '/blood-glucose-progress',
                      icon: Icon(
                        CustomIcon.blood_glucose,
                        size: 20,
                        color: blue,
                      ),
                    ),
                    Option(
                      optionName: 'Blood pressure',
                      optionRoute: '/blood-pressure-progress',
                      icon: Icon(
                        CustomIcon.blood_pressure,
                        size: 20,
                        color: blue,
                      ),
                    ),
                    Option(
                      optionName: 'Weight',
                      optionRoute: '/weight-progress',
                      icon: Icon(
                        CustomIcon.weight,
                        size: 20,
                        color: blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Option extends StatelessWidget {
  const Option({
    required this.optionName,
    required this.optionRoute,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final String optionName, optionRoute;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 17.5,
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, optionRoute),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon,
                const XMargin(16),
                Text(optionName),
              ],
            ),
            const Icon(
              Icons.chevron_right,
              color: grey,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}

class LinkOption extends StatelessWidget {
  const LinkOption({
    required this.optionName,
    required this.optionLink,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final String optionName, optionLink;
  final Icon icon;

  Future<void> _openLink(String urlString) async {
    final Uri url = Uri.parse(urlString);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 17.5,
      ),
      child: InkWell(
        onTap: () => _openLink(optionLink),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon,
                const XMargin(16),
                Text(
                  optionName,
                ),
              ],
            ),
            const Icon(
              Icons.chevron_right,
              color: grey,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
