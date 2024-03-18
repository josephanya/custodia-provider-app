import 'package:cached_network_image/cached_network_image.dart';
import 'package:custodia_provider/models/alert_model.dart';
import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/core/extensions/view_state.dart';
import 'package:custodia_provider/ui/views/home/alert_details/alert_details_vm.dart';
import 'package:custodia_provider/ui/views/photo/full_photo.dart';
import 'package:custodia_provider/ui/views/patients/patient_profile/patient_profile.dart';
import 'package:custodia_provider/ui/widgets/utils/appbar.dart';
import 'package:custodia_provider/ui/widgets/utils/buttons.dart';
import 'package:custodia_provider/ui/widgets/utils/loader.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final provider = ref.watch(alertsDetailProvider);
    final providerNotifier = ref.watch(alertsDetailProvider.notifier);
    return Scaffold(
      appBar: appBarWithAction(
        context,
        '',
        GestureDetector(
          onTap: () => providerNotifier.resolveAlert(alert.alertID),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 14.h,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                child: const Icon(
                  Icons.check,
                  size: 16,
                  color: AppColors.blue,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: 15.h,
            horizontal: 16.w,
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
                    Text(
                      alert.alertType,
                      style: TextStyle(
                        fontSize: FontSize.s18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const YMargin(8),
                    Text(
                      'Triggered at ${DateFormat('d/M/y, hh:mm aaa').format(alert.triggerTime)}',
                      style: TextStyle(
                        fontSize: FontSize.s13,
                        color: AppColors.grey,
                      ),
                    ),
                    const YMargin(35),
                    Column(
                        children: alert.data.entries.map((entry) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: 20.h,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 90.w,
                              child: Text(
                                '${entry.key}:',
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: FontSize.s13,
                                ),
                              ),
                            ),
                            const XMargin(20),
                            (entry.key == 'image_url')
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
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.r),
                                      ),
                                      child: CachedNetworkImage(
                                        placeholder: (context, url) =>
                                            Container(
                                          width: 70.w,
                                          height: 70.h,
                                          decoration: BoxDecoration(
                                            color: AppColors.lightBlue,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.r),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Loader(),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                          'images/img_not_available.jpeg',
                                          width: 70.w,
                                          height: 70.h,
                                          fit: BoxFit.cover,
                                        ),
                                        imageUrl: entry.value,
                                        width: 70.w,
                                        height: 70.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : Flexible(
                                    child: Text(
                                      entry.value,
                                      style: TextStyle(
                                        fontSize: FontSize.s13,
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
        color: AppColors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 10.h,
          ),
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
