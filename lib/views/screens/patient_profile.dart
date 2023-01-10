import 'package:custodia_provider/views/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/theme/theme.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/views/widgets/buttons.dart';
import 'package:custodia_provider/views/widgets/default_card.dart';

final List biomarkerOptions = [
  {'name': 'Blood glucose', 'route': '/blood-glucose-progress'},
  {'name': 'Blood pressure', 'route': '/blood-pressure-progress'},
  {'name': 'Weight', 'route': '/weight-progress'},
];

final List dietOptions = [
  {'name': 'Food & drinks', 'route': '/food-entries'},
  {'name': 'Meal planner', 'route': '/meal-planner'},
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
            horizontal: 16,
            vertical: 15,
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
              const YMargin(20),
              const Text(
                'Joseph Anya',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YMargin(7),
              const Text(
                '4783484 • Female',
                style: TextStyle(
                  color: grey,
                  fontSize: 13,
                ),
              ),
              const YMargin(35),
              DefaultCard(
                onPress: () =>
                    Navigator.pushNamed(context, '/patient-information'),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 19,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Personal information',
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: grey,
                        size: 16,
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
                          Text(
                            biomarkerOptions[index]['name'],
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: grey,
                            size: 16,
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
                          Text(
                            dietOptions[index]['name'],
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: grey,
                            size: 16,
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
