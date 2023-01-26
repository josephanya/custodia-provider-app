import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/buttons.dart';
import 'package:custodia_provider/ui/widgets/default_card.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/utils/margin.dart';

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
  const PatientProfile({super.key});

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
                  const CircleAvatar(
                    radius: 35,
                  ),
                  TetiaryButtonOutlined(
                    onPress: () => Navigator.pushNamed(context, '/chat'),
                    buttonText: 'Message',
                  ),
                ],
              ),
              const YMargin(15),
              const Text(
                'Joseph Anya',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YMargin(4),
              const Text(
                '4783484 • Female',
                style: TextStyle(
                  color: grey,
                  fontSize: 13,
                ),
              ),
              const YMargin(30),
              DefaultCard(
                onPress: () =>
                    Navigator.pushNamed(context, '/patient-information'),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 18,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          CircleAvatar(
                            radius: 10,
                          ),
                          XMargin(16),
                          Text(
                            'Personal information',
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
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 19,
                    ),
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(
                          context, biomarkerOptions[index]['route']),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 10,
                              ),
                              const XMargin(16),
                              Text(
                                biomarkerOptions[index]['name'],
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
                  ),
                  itemCount: biomarkerOptions.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 19,
                    ),
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(
                          context, dietOptions[index]['route']),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 10,
                              ),
                              const XMargin(16),
                              Text(
                                dietOptions[index]['name'],
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
                  ),
                  itemCount: dietOptions.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
