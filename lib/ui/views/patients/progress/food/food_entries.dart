import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/views/patients/progress/food/food_entries_vm.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/food_log_card.dart';
import 'package:custodia_provider/ui/widgets/loader.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:custodia_provider/ui/core/extensions/view_state.dart';

class FoodEntries extends ConsumerStatefulWidget {
  const FoodEntries({
    Key? key,
    this.patientID,
  }) : super(key: key);

  final String? patientID;
  @override
  ConsumerState<FoodEntries> createState() => _FoodEntriesState();
}

class _FoodEntriesState extends ConsumerState<FoodEntries> {
  @override
  void initState() {
    super.initState();
    ref.read(getFoodrovider.notifier).initialize(widget.patientID);
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(getFoodrovider);
    return Scaffold(
      appBar: appBar(context, 'Food'),
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
              : provider.entries == null || provider.viewState.isError
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
                              'Food entries will show up here',
                              style: TextStyle(color: grey, height: 1.35),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: provider.entries?.length,
                      itemBuilder: (context, index) {
                        return FoodLogCard(
                          food: provider.entries?[index].food,
                          mealType: provider.entries?[index].mealType,
                          imageURL: provider.entries?[index].imageURL,
                          date: provider.entries?[index].timestamp,
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
