import 'package:custodia_provider/models/patient_model.dart';
import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/core/constants/custom_icons.dart';
import 'package:custodia_provider/ui/core/routes.dart';
import 'package:custodia_provider/ui/views/patients/patient_profile/patient_profile_vm.dart';
import 'package:custodia_provider/ui/widgets/utils/appbar.dart';
import 'package:custodia_provider/ui/widgets/utils/buttons.dart';
import 'package:custodia_provider/ui/widgets/utils/default_card.dart';
import 'package:custodia_provider/ui/widgets/utils/loader.dart';
import 'package:custodia_provider/utils/utility_functions.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          child: provider.viewState.isLoading
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                    ),
                    child: const Loader(),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 32.r,
                          backgroundColor: AppColors.blue,
                          foregroundColor: AppColors.white,
                          child: Text(
                            '${provider.patient!.firstName[0].toUpperCase()}${provider.patient!.lastName[0].toUpperCase()}',
                            style: TextStyle(
                              fontSize: FontSize.s20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
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
                    const YMargin(16),
                    Text(
                      '${provider.patient!.firstName} ${provider.patient!.lastName}',
                      style: TextStyle(
                        fontSize: FontSize.s18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const YMargin(4),
                    Text(
                      '${provider.patient!.gender} • ${UtilityFunctions.calculateAge(provider.patient!.dob)}',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: FontSize.s13,
                      ),
                    ),
                    const YMargin(32),
                    Text(
                      'Personal info',
                      style: TextStyle(
                        fontSize: FontSize.s16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const YMargin(12),
                    DefaultCard(
                      child: Column(
                        children: [
                          PatientDetailOption(
                            optionName: 'Patient details',
                            optionRoute: Routes.patientDetailsView,
                            patientModel: provider.patient!,
                            icon: const Icon(
                              CustomIcon.information,
                              size: 20,
                              color: AppColors.blue,
                            ),
                          ),
                          const Option(
                            optionName: 'Medical records',
                            optionRoute: Routes.medicalRecordsView,
                            icon: Icon(
                              CustomIcon.medicalRecords,
                              size: 20,
                              color: AppColors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const YMargin(32),
                    Text(
                      'Health data',
                      style: TextStyle(
                        fontSize: FontSize.s16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const YMargin(12),
                    DefaultCard(
                      child: Column(
                        children: [
                          Option(
                            optionName: 'Food',
                            optionRoute: Routes.foodLogsView,
                            patientID: provider.patient!.patientID,
                            icon: const Icon(
                              CustomIcon.food,
                              size: 20,
                              color: AppColors.blue,
                            ),
                          ),
                          Option(
                            optionName: 'Blood glucose',
                            optionRoute: Routes.bloodGlucoseLogsView,
                            patientID: provider.patient!.patientID,
                            icon: const Icon(
                              CustomIcon.bloodGlucose,
                              size: 20,
                              color: AppColors.blue,
                            ),
                          ),
                          Option(
                            optionName: 'Blood pressure',
                            optionRoute: Routes.bloodPressureLogsView,
                            patientID: provider.patient!.patientID,
                            icon: const Icon(
                              CustomIcon.bloodPressure,
                              size: 20,
                              color: AppColors.blue,
                            ),
                          ),
                          Option(
                            optionName: 'Weight',
                            optionRoute: Routes.weightLogsView,
                            patientID: provider.patient!.patientID,
                            icon: const Icon(
                              CustomIcon.weight,
                              size: 20,
                              color: AppColors.blue,
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
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
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
                Text(
                  optionName,
                  style: TextStyle(
                    fontSize: FontSize.s14,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.chevron_right,
              color: AppColors.grey,
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
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
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
                Text(
                  optionName,
                  style: TextStyle(
                    fontSize: FontSize.s14,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.chevron_right,
              color: AppColors.grey,
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
        horizontal: 16,
        vertical: 16,
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
                  style: TextStyle(
                    fontSize: FontSize.s14,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.chevron_right,
              color: AppColors.grey,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
