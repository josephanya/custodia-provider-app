import 'package:cached_network_image/cached_network_image.dart';
import 'package:custodia_provider/models/alert_model.dart';
import 'package:custodia_provider/ui/core/extensions/view_state.dart';
import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/views/home/alerts_details_vm.dart';
import 'package:custodia_provider/ui/views/photo/full_photo.dart';
import 'package:custodia_provider/ui/views/patients/patient_profile/patient_profile.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/buttons.dart';
import 'package:custodia_provider/ui/widgets/loader.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class AlertDetails extends ConsumerStatefulWidget {
  const AlertDetails({
    Key? key,
    required this.alert,
  }) : super(key: key);

  final AlertModel alert;

  @override
  ConsumerState<AlertDetails> createState() => _AlertDetailsState();
}

class _AlertDetailsState extends ConsumerState<AlertDetails> {
  @override
  Widget build(BuildContext context) {
    final alert = widget.alert;
    final provider = ref.watch(alertProvider);
    final providerNotifier = ref.watch(alertProvider.notifier);
    return Scaffold(
      appBar: appBarWithAction(
        context,
        '',
        GestureDetector(
          onTap: () => providerNotifier.resolveAlert(alert.alertID),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              decoration: const BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(
                  Icons.check,
                  size: 16,
                  color: blue,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
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
                    Text(
                      alert.alertType,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const YMargin(8),
                    Text(
                      'Triggered at ${DateFormat('d/M/y, hh:mm aaa').format(alert.triggerTime)}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: grey,
                      ),
                    ),
                    const YMargin(35),
                    Column(
                        children: alert.data.entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 20,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 90,
                              child: Text(
                                '${entry.key}:',
                                style: const TextStyle(
                                  color: grey,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            const XMargin(20),
                            (entry.key == 'Photo')
                                ? GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FullPhoto(
                                          path: entry.value,
                                        ),
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      child: CachedNetworkImage(
                                        placeholder: (context, url) =>
                                            Container(
                                          width: 70,
                                          height: 70,
                                          decoration: const BoxDecoration(
                                            color: lightBlue,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Loader(),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                          'images/img_not_available.jpeg',
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.cover,
                                        ),
                                        imageUrl: entry.value,
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : Flexible(
                                    child: Text(
                                      entry.value,
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      );
                    }).toList()),
                  ],
                ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        color: white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SecondaryButton(
                buttonText: 'View patient info',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatientProfile(
                      patientID: alert.patientID,
                    ),
                  ),
                ),
              ),
              const YMargin(15),
              SecondaryButton(
                buttonText: 'Message patient',
                onPressed: () => Navigator.pushNamed(
                  context,
                  '/chat',
                  arguments: alert.patientID,
                ),
              ),
              const YMargin(15),
            ],
          ),
        ),
      ),
    );
  }
}
