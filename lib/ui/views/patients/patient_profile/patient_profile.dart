import 'package:custodia_provider/models/patient_model.dart';
import 'package:custodia_provider/ui/core/theme/custom_icons.dart';
import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/views/patients/patient_profile/patient_profile_vm.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/buttons.dart';
import 'package:custodia_provider/ui/widgets/default_card.dart';
import 'package:custodia_provider/ui/widgets/loader.dart';
import 'package:custodia_provider/utils/utility_functions.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:custodia_provider/ui/core/extensions/view_state.dart';

class PatientProfile extends ConsumerStatefulWidget {
  const PatientProfile({
    Key? key,
    required this.patientID,
  }) : super(key: key);

  final String patientID;

  @override
  ConsumerState<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends ConsumerState<PatientProfile> {
  @override
  void initState() {
    super.initState();
    ref.read(patientProvider.notifier).initialize(widget.patientID);
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(patientProvider);
    return Scaffold(
      appBar: appBar(context, ''),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 16,
          ),
          child: provider.viewState.isLoading
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Loader(),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: blue,
                          foregroundColor: white,
                          child: Text(
                            '${provider.patient!.firstName[0].toUpperCase()}${provider.patient!.lastName[0].toUpperCase()}',
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TetiaryButtonOutlined(
                          onPress: () => Navigator.pushNamed(
                            context,
                            '/chat',
                            arguments: provider.patient!.patientID,
                          ),
                          buttonText: 'Message',
                        ),
                      ],
                    ),
                    const YMargin(15),
                    Text(
                      '${provider.patient!.firstName} ${provider.patient!.lastName}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const YMargin(4),
                    Text(
                      '${provider.patient!.gender} • ${UtilityFunctions.calculateAge(provider.patient!.dob)}',
                      style: const TextStyle(
                        color: grey,
                        fontSize: 13,
                      ),
                    ),
                    const YMargin(30),
                    const Text(
                      'Personal info',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const YMargin(15),
                    DefaultCard(
                      child: Column(
                        children: [
                          PatientDetailOption(
                            optionName: 'Patient details',
                            optionRoute: '/patient-details',
                            patientModel: provider.patient!,
                            icon: const Icon(
                              CustomIcon.information,
                              size: 20,
                              color: blue,
                            ),
                          ),
                          const Option(
                            optionName: 'Medical records',
                            optionRoute: '/medical-records',
                            icon: Icon(
                              CustomIcon.medical_records,
                              size: 20,
                              color: blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const YMargin(35),
                    const Text(
                      'Health data',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const YMargin(15),
                    DefaultCard(
                      child: Column(
                        children: [
                          Option(
                            optionName: 'Food',
                            optionRoute: '/food-entries',
                            patientID: provider.patient!.patientID,
                            icon: const Icon(
                              CustomIcon.food,
                              size: 20,
                              color: blue,
                            ),
                          ),
                          Option(
                            optionName: 'Blood glucose',
                            optionRoute: '/readings-blood-glucose',
                            patientID: provider.patient!.patientID,
                            icon: const Icon(
                              CustomIcon.blood_glucose,
                              size: 20,
                              color: blue,
                            ),
                          ),
                          Option(
                            optionName: 'Blood pressure',
                            optionRoute: '/readings-blood-pressure',
                            patientID: provider.patient!.patientID,
                            icon: const Icon(
                              CustomIcon.blood_pressure,
                              size: 20,
                              color: blue,
                            ),
                          ),
                          Option(
                            optionName: 'Weight',
                            optionRoute: '/readings-weight',
                            patientID: provider.patient!.patientID,
                            icon: const Icon(
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
    this.patientID,
    this.patientModel,
    Key? key,
  }) : super(key: key);

  final String optionName, optionRoute;
  final String? patientID;
  final Icon icon;
  final PatientModel? patientModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 17.5,
      ),
      child: InkWell(
        onTap: () =>
            Navigator.pushNamed(context, optionRoute, arguments: patientID),
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

class PatientDetailOption extends StatelessWidget {
  const PatientDetailOption({
    required this.optionName,
    required this.optionRoute,
    required this.icon,
    this.patientModel,
    Key? key,
  }) : super(key: key);

  final String optionName, optionRoute;
  final Icon icon;
  final PatientModel? patientModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 17.5,
      ),
      child: InkWell(
        onTap: () =>
            Navigator.pushNamed(context, optionRoute, arguments: patientModel),
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
