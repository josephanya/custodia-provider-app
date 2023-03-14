import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/views/patients/progress/blood_glucose/blood_glucose_vm.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/default_card.dart';
import 'package:custodia_provider/ui/widgets/loader.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: provider.viewState.isLoading
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Loader(),
                  ),
                )
              : provider.readings == null || provider.viewState.isError
                  ? Center(
                      child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 250,
                      ),
                      child: Column(
                        children: const [
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
                    ))
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Date',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'mg/dl',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        DefaultCard(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: provider.readings?.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 15,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      DateFormat('MMM dd, hh:mm aaa').format(
                                          provider.readings?[index].timestamp),
                                      style: const TextStyle(
                                        fontSize: 13.5,
                                        color: grey,
                                      ),
                                    ),
                                    Text(
                                      provider.readings?[index].bloodGlucose,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const YMargin(12),
                      ],
                    ),
        ),
      ),
    );
  }
}
