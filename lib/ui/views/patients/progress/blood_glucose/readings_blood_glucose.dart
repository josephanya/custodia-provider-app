import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/views/patients/progress/blood_glucose/blood_glucose_vm.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/blood_glucose_log_card.dart';
import 'package:custodia_provider/ui/widgets/loader.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:custodia_provider/ui/core/extensions/view_state.dart';

class ReadingsBloodGlucose extends ConsumerStatefulWidget {
  const ReadingsBloodGlucose({
    Key? key,
    this.patientID,
  }) : super(key: key);

  final String? patientID;

  @override
  ReadingsBloodGlucoseState createState() => ReadingsBloodGlucoseState();
}

class ReadingsBloodGlucoseState extends ConsumerState<ReadingsBloodGlucose> {
  @override
  void initState() {
    super.initState();
    ref.read(getBloodGlucoseProvider.notifier).initialize(widget.patientID);
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(getBloodGlucoseProvider);
    return Scaffold(
      appBar: appBar(context, 'All Readings'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
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
              : provider.readings!.isEmpty || provider.viewState.isError
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 250,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'No data yet',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            YMargin(14),
                            Text(
                              'Blood glucose readings will show up here',
                              style: TextStyle(color: grey, height: 1.35),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: provider.readings?.length ?? 1,
                      itemBuilder: (context, index) {
                        return BloodGlucoseLogCard(
                          bloodGlucose: provider.readings?[index].bloodGlucose,
                          bgContext: provider.readings?[index].context,
                          date: provider.readings?[index].timestamp,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const YMargin(12);
                      },
                    ),
        ),
      ),
    );
  }
}
